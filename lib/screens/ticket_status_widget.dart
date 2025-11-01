import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 整理券発行画面へ遷移するためのインポート
import 'bunkasai/tenji/ticket_create_screen.dart'; 

class TicketStatusWidget extends StatefulWidget {
  final String tenjiId;
  final String tenjiName;

  const TicketStatusWidget({
    super.key,
    required this.tenjiId,
    required this.tenjiName,
  });

  @override
  State<TicketStatusWidget> createState() => _TicketStatusWidgetState();
}

class _TicketStatusWidgetState extends State<TicketStatusWidget> {
  String? _localSessionId;
  // 💡 ticket_create_screen.dart と完全に同じキーを使用することで同期を保証
  static const String _sessionIdKey = 'chigusai_ticket_session_id'; 

  Stream<QuerySnapshot>? _ticketStream;

  @override
  void initState() {
    super.initState();
    _loadAndInitialize(); 
  }

  void _loadAndInitialize() async {
    // 1. セッションIDのロード/新規生成
    await _initializeSessionId();
    
    // 2. セッションIDが確定したら、チケットの監視を開始
    _initializeTicketStream();
    
    // 3. StreamBuilderがリビルドされるようにsetStateを呼ぶ
    if (mounted) {
      setState(() {});
    }
  }

  // shared_preferencesからセッションIDを読み込み、なければ新規生成して保存
  Future<void> _initializeSessionId() async {
    final prefs = await SharedPreferences.getInstance();
    String? storedId = prefs.getString(_sessionIdKey);

    if (storedId == null) {
      _localSessionId = const Uuid().v4();
      await prefs.setString(_sessionIdKey, _localSessionId!);
    } else {
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

  // 整理券発行画面へ遷移するメソッド
  void _navigateToCreateScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => TicketCreateScreen(
          tenjiId: widget.tenjiId,
          tenjiName: widget.tenjiName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // セッションIDロード中の表示
    if (_localSessionId == null || _ticketStream == null) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20, 
              height: 20, 
              child: CircularProgressIndicator(strokeWidth: 2)
            ),
            SizedBox(width: 10),
            Text('整理券状態を確認中...', style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    return StreamBuilder<QuerySnapshot>(
      stream: _ticketStream,
      builder: (context, snapshot) {
        // ロード中の表示
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
             padding: EdgeInsets.symmetric(vertical: 20),
             child: CircularProgressIndicator(),
          );
        }

        // エラーハンドリング
        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text('エラーが発生しました: ${snapshot.error}', style: const TextStyle(color: Colors.red)),
          );
        }

        // 有効なチケットが見つかった場合 (取得済み)
        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          final ticketData = snapshot.data!.docs.first.data() as Map<String, dynamic>;
          final ticketNumber = ticketData['ticketNumber'] ?? '??';

          return _buildTicketAcquiredState(ticketNumber.toString());
        }

        // 有効なチケットが見つからなかった場合 (未取得) -> 発行ボタンを表示
        return _buildIssueButton(context);
      },
    );
  }
  
  // 整理券取得済み状態のウィジェット
  Widget _buildTicketAcquiredState(String ticketNumber) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.lightGreen.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.lightGreen.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '整理券 取得済み',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              const SizedBox(height: 4),
              Text(
                '番号: ${ticketNumber}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.green),
              ),
            ],
          ),
          const Icon(Icons.check_circle, color: Colors.green, size: 40),
        ],
      ),
    );
  }

  // 整理券発行ボタンのウィジェット
  Widget _buildIssueButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => _navigateToCreateScreen(context),
        icon: const Icon(Icons.confirmation_number_outlined),
        label: const Text('整理券を取得する (タップで発行画面へ)'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
