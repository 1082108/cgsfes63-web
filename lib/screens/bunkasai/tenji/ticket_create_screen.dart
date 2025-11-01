import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart'; // セッション永続化のためにインポート

class TicketCreateScreen extends StatefulWidget {
  final String tenjiId;
  final String tenjiName;

  const TicketCreateScreen({
    super.key,
    required this.tenjiId,
    required this.tenjiName,
  });

  @override
  State<TicketCreateScreen> createState() => _TicketCreateScreenState();
}

class _TicketCreateScreenState extends State<TicketCreateScreen> {
  bool _isLoading = false;
  
  // セッションIDの管理
  String? _localSessionId;
  // 💡 ticket_status_widget.dart と同じキーを使用し同期を保証
  static const String _sessionIdKey = 'chigusai_ticket_session_id'; 

  // チケットのストリーム (監視)
  Stream<QuerySnapshot>? _ticketStream;

  @override
  void initState() {
    super.initState();
    // 非同期処理の完了を待たずに初期化を開始
    _loadAndInitialize(); 
  }

  // 初期化処理をまとめた非同期メソッド
  void _loadAndInitialize() async {
    // 1. セッションIDのロード/新規生成
    await _initializeSessionId();
    
    // 2. セッションIDが確定したら、チケットの監視を開始
    _initializeTicketStream();
    
    // 3. StreamBuilderがリビルドされるようにsetStateを呼ぶ
    setState(() {});
  }

  // shared_preferencesからセッションIDを読み込み、なければ新規生成して保存
  Future<void> _initializeSessionId() async {
    final prefs = await SharedPreferences.getInstance();
    String? storedId = prefs.getString(_sessionIdKey);

    if (storedId == null) {
      // IDが存在しない場合、新規生成して保存
      _localSessionId = const Uuid().v4();
      await prefs.setString(_sessionIdKey, _localSessionId!);
    } else {
      // 既存のIDを読み込み
      _localSessionId = storedId;
    }
  }

  // 監視するクエリの設定
  void _initializeTicketStream() {
    if (_localSessionId == null) return;

    final firestore = FirebaseFirestore.instance;
    // 永続化されたセッションIDを使用してチケットの状態を監視
    _ticketStream = firestore.collection('tickets')
        .where('tenjiId', isEqualTo: widget.tenjiId)
        .where('sessionId', isEqualTo: _localSessionId)
        .where('status', isEqualTo: 'valid')
        .limit(1)
        .snapshots(); // リアルタイム監視
  }


  Future<void> _createTicket(BuildContext context) async {
    final sessionId = _localSessionId;
    if (sessionId == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('エラー: セッション情報が取得できません。')),
        );
      }
      return;
    }

    setState(() => _isLoading = true);
    final firestore = FirebaseFirestore.instance;
    final counterRef = firestore.collection('counters').doc(widget.tenjiId);
    final ticketRef = firestore.collection('tickets').doc();

    try {
      // トランザクションに入る前に重複チェックを実行
      if (await _hasExistingValidTicket(sessionId)) {
         throw Exception('既にこの展示の整理券を1枚取得しています。');
      }
      
      int nextNumber = 0;
      
      await firestore.runTransaction((transaction) async {
        final counterSnap = await transaction.get(counterRef);

        int currentNumber = counterSnap.exists ? (counterSnap['currentNumber'] ?? 0) : 0;
        nextNumber = currentNumber + 1;
        
        // カウンターを更新/作成
        transaction.set(counterRef, {
          'currentNumber': nextNumber,
          'tenjiName': widget.tenjiName, 
        });

        // 新しい整理券ドキュメントを作成
        transaction.set(ticketRef, {
          'tenjiId': widget.tenjiId,
          'tenjiName': widget.tenjiName,
          'timestamp': FieldValue.serverTimestamp(),
          'status': 'valid',
          'ticketId': ticketRef.id,
          'ticketNumber': nextNumber, 
          'sessionId': sessionId, 
        });
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.tenjiName} の整理券発行に成功しました。'),
            duration: const Duration(seconds: 3),
          ),
        );
      }

    } catch (e) {
      print('ERROR: 整理券発行失敗: ${e.toString()}'); 
      final isDuplicateError = e.toString().contains('既にこの展示');
      final baseMessage = isDuplicateError 
          ? e.toString().replaceFirst('Exception: ', '')
          : '整理券発行に失敗しました。';
      final detailMessage = e is FirebaseException ? ' (${e.code})' : '';

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('エラー: $baseMessage$detailMessage')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // トランザクション前の事前チェック用（Streamとは独立）
  Future<bool> _hasExistingValidTicket(String sessionId) async {
    final firestore = FirebaseFirestore.instance;
    final existingTicketQuery = firestore.collection('tickets')
        .where('tenjiId', isEqualTo: widget.tenjiId)
        .where('sessionId', isEqualTo: sessionId)
        .where('status', isEqualTo: 'valid');

    final existingTicketsSnapshot = await existingTicketQuery.get();
    return existingTicketsSnapshot.docs.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    // セッションIDロード中のローディング表示
    if (_localSessionId == null) {
      return Scaffold(
        appBar: AppBar(title: Text('${widget.tenjiName} 整理券'), backgroundColor: Colors.indigo),
        body: const Center(child: CircularProgressIndicator(color: Colors.indigo)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('${widget.tenjiName} 整理券'), backgroundColor: Colors.indigo),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.confirmation_number_outlined, color: Colors.indigo, size: 80),
              const SizedBox(height: 24),
              Text(widget.tenjiName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              
              // StreamBuilderを使ってチケットの状態を監視
              _ticketStream == null
                  ? const Column(
                      children: [
                        Text('チケット情報の準備中...', style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 16),
                        CircularProgressIndicator(),
                      ],
                    )
                  : StreamBuilder<QuerySnapshot>(
                      stream: _ticketStream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting || _isLoading) {
                          return const Column(
                            children: [
                              Text('状態を確認中...', style: TextStyle(color: Colors.grey)),
                              SizedBox(height: 16),
                              CircularProgressIndicator(),
                            ],
                          );
                        }

                        // エラーハンドリング
                        if (snapshot.hasError) {
                          return Text('チケット情報読み込みエラー: ${snapshot.error}', style: const TextStyle(color: Colors.red));
                        }

                        // 有効なチケットが見つかった場合
                        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                          final ticketData = snapshot.data!.docs.first.data() as Map<String, dynamic>;
                          final ticketNumber = ticketData['ticketNumber'] ?? '??';

                          return _buildTicketAcquiredState(ticketNumber.toString());
                        }

                        // 有効なチケットが見つからなかった場合 -> 発行ボタンを表示
                        return _buildIssueButton(context);
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
  
  // 整理券取得済み状態のウィジェット
  Widget _buildTicketAcquiredState(String ticketNumber) {
    return Column(
      children: [
        const Text(
          '【整理券 取得済み】',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        const SizedBox(height: 16),
        Text(
          'あなたの整理券番号',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.shade300, width: 2),
          ),
          child: Text(
            ticketNumber,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: Colors.green,
            ),
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'この展示の整理券は既に取得されています。',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  // 整理券発行ボタンのウィジェット
  Widget _buildIssueButton(BuildContext context) {
    return Column(
      children: [
        const Text(
          '整理券を発行しますか？\n（同じ展示は1枚のみ取得可能です）',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 32),
        ElevatedButton.icon(
          onPressed: _isLoading ? null : () => _createTicket(context),
          icon: const Icon(Icons.add),
          label: const Text('整理券を発行する'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
