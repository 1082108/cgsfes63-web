import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 注意事項に同意済みかどうか（true: 同意済み/false: 未同意）をロードするFutureProvider
// アプリ起動時に、このProviderの状態を監視し、画面を HyojiScreen か BottomNavigation に分岐させます。
final hasAgreedToTermsProvider = FutureProvider<bool>((ref) async {
  // SharedPreferencesのインスタンスを取得
  final prefs = await SharedPreferences.getInstance();
  
  // 'agreed_to_terms'キーの値を取得。キーがなければ初回起動と見なし false を返す
  return prefs.getBool('agreed_to_terms') ?? false;
});

// 注意事項に同意した際に呼び出され、状態を永続化する関数
Future<void> setAgreedToTerms() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('agreed_to_terms', true);
}
