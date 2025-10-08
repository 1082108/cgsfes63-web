// lib/screens/quiz/quiz_screen.dart

import 'package:flutter/material.dart';
import 'dart:math'; // ランダム機能は不要ですが、一応残します

// ★★★ quiz_data.dart への相対パスを、このファイルの場所に合わせて修正してください。 ★★★
import '../../data/quiz/quiz_data.dart';
// ★★★ ★★★ ★★★ ★★★

// quizListはList<Map<String, dynamic>>の形式で定義されている必要があります。

class QuizPage extends StatefulWidget {
  // アプリのルーティングで使用できるように routeName を定義
  static const routeName = '/quiz'; 
  
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // 1. 現在の問題のインデックスを追跡する変数を追加 (順番出題用)
  int _currentQuestionIndex = 0;
  
  // 型を明確に定義し、null許容型ではないことを保証します
  late Map<String, dynamic> currentQuestion;
  bool showAnswer = false;
  int? selectedAnswerIndex; // ユーザーが選択した回答のインデックスを保持

  @override
  void initState() {
    super.initState();
    // ランダムではなく、インデックスに基づいて最初の問題をロード
    _loadQuestion(); 
  }

  // 2. 順番で問題をロードするメソッド (現在のインデックスを使用)
  void _loadQuestion() {
    // quizListが空でないことを確認
    if (quizList.isNotEmpty) {
      // インデックスで問題を取得
      currentQuestion = quizList[_currentQuestionIndex];
    } else {
      // quizListが空の場合の安全策
      currentQuestion = {'question': '問題がありません。', 'options': ['', '', '', ''], 'answer': 0};
    }
    setState(() {
      showAnswer = false;
      selectedAnswerIndex = null; // 新しい問題で選択をリセット
    });
  }
  
  // 3. 次の問題へ進むか、最初に戻るかを判断するメソッド
  void _loadNextQuestion() {
    // インデックスをインクリメント
    int nextIndex = _currentQuestionIndex + 1;

    if (nextIndex < quizList.length) {
      // 次の問題があればそのまま進む
      setState(() {
        _currentQuestionIndex = nextIndex;
      });
      _loadQuestion();
    } else {
      // 全ての問題が終了した場合
      setState(() {
        // インデックスをリセットして最初に戻る
        _currentQuestionIndex = 0;
      });
      _loadQuestion(); // 最初に戻る
      
      // ユーザーに終了を通知
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('全問終了しました！最初に戻ります。'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _selectAnswer(int index) {
    // 回答がまだ表示されていない場合のみ処理
    if (!showAnswer) {
      setState(() {
        selectedAnswerIndex = index; // 選択した回答を保持
        showAnswer = true; // 回答を表示
      });
    }
  }

  // 選択肢ボタンの背景色を決定するヘルパー関数 (フィードバック強化用)
  Color? _getButtonColor(int index, int correctAnswerIndex) {
    if (!showAnswer) {
      return null; 
    }
    
    if (index == correctAnswerIndex) {
      // 正解の選択肢
      return Colors.green.shade600;
    } else if (index == selectedAnswerIndex) {
      // ユーザーが選択した不正解の選択肢
      return Colors.red.shade600; 
    } else {
      // その他の選択肢
      return Colors.grey.shade200;
    }
  }

  // 選択肢ボタンの前景色（テキストの色）を決定するヘルパー関数
  Color _getForegroundColor(int index, int correctAnswerIndex) {
    if (!showAnswer) {
      return Theme.of(context).textTheme.labelLarge?.color ?? Colors.black87;
    }
    
    if (index == correctAnswerIndex || index == selectedAnswerIndex) {
      return Colors.white; 
    } else {
      return Colors.black87; 
    }
  }

  @override
  Widget build(BuildContext context) {
    if (quizList.isEmpty) {
       return const Scaffold(
        body: Center(child: Text('問題が読み込めませんでした。')),
      );
    }
    
    // 型を確定させます
    final correctAnswerIndex = currentQuestion['answer'] as int;
    final options = currentQuestion['options'] as List<String>;
    
    // 現在の問題が出題順の最後の問題かどうかを判定
    final isLastQuestion = _currentQuestionIndex + 1 == quizList.length;

    return Scaffold(
      appBar: AppBar(
        // 問題の進捗状況を表示
        title: Text('暇つぶしクイズ (${_currentQuestionIndex + 1}/${quizList.length})'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 問題文
              Text(
                currentQuestion['question'] as String,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              
              // 選択肢ボタン
              ...List.generate(4, (index) {
                final isCorrectAnswer = index == correctAnswerIndex;
                final isSelectedAnswer = index == selectedAnswerIndex;

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  width: double.infinity,
                  child: ElevatedButton(
                    // 回答表示後はボタンを無効化
                    onPressed: showAnswer ? null : () => _selectAnswer(index),
                    style: ElevatedButton.styleFrom(
                      // ボタンの色を設定
                      backgroundColor: _getButtonColor(index, correctAnswerIndex),
                      // テキストの色を設定
                      foregroundColor: _getForegroundColor(index, correctAnswerIndex),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      disabledBackgroundColor: _getButtonColor(index, correctAnswerIndex),
                    ),
                    child: Text(
                      options[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: (showAnswer && (isCorrectAnswer || isSelectedAnswer)) 
                                      ? FontWeight.bold 
                                      : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
              
              const SizedBox(height: 20),
              
              // 回答表示と次の問題へボタン
              if (showAnswer) ...[
                // ユーザーが正解したかどうかを表示
                Text(
                  selectedAnswerIndex == correctAnswerIndex ? '🎉 正解です！' : '❌ 不正解...！',
                  style: TextStyle(
                    fontSize: 24, 
                    color: selectedAnswerIndex == correctAnswerIndex ? Colors.green.shade800 : Colors.red.shade800, 
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '正解は ${options[correctAnswerIndex]} でした',
                  style: const TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  // 次の問題へ進む or 最初に戻る
                  onPressed: _loadNextQuestion,
                  icon: Icon(isLastQuestion ? Icons.undo : Icons.arrow_forward),
                  label: Text(isLastQuestion ? '最初に戻る' : '次の問題へ'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}