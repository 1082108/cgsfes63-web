import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../bottom_navigation.dart';
// ★★★ ここが最重要：このパスがあなたのプロジェクト構造と一致しているか確認してください ★★★
import '../hyoji/initialization_provider.dart'; // 初回起動状態を管理するProvider

// 注意事項表示画面 (HyojiScreen)
class HyojiScreen extends ConsumerWidget { 
  static const routeName = '/hyoji-screen'; 
  const HyojiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('ご利用にあたっての注意事項')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    // --- ここに実際に表示したい注意事項のテキストを記述してください ---
                    '【ご利用前の重要なお知らせ】\n\n'
                    'この「千種祭アプリ」をご利用いただきありがとうございます。'
                    '本アプリの利用にあたり、以下の事項にご同意ください。\n\n'
                    '1. 情報の正確性：アプリ内のイベント情報、スケジュールなどは、'
                    '準備状況により変更になる可能性があります。最新の情報は当日ご確認ください。\n'
                    '2. 個人情報：本アプリでは、ログイン時を除き、個人を特定する情報を収集しません。\n'
                    '3. 利用禁止行為：イベントの妨害や、公序良俗に反する行為は厳禁です。\n\n'
                    '上記の内容を確認し、同意された方のみご利用いただけます。'
                    // -----------------------------------------------------------------
                    ,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor, 
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    // setAgreedToTerms は initialization_provider.dart で定義された関数
                    await setAgreedToTerms(); 
                    // hasAgreedToTermsProvider も同じファイルで定義された Provider
                    ref.invalidate(hasAgreedToTermsProvider); 

                    if (context.mounted) {
                       Navigator.of(context).pushReplacement(
                         MaterialPageRoute(builder: (ctx) => BottomNavigation()),
                       );
                    }
                  },
                  child: const Text('同意してアプリを始める', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
