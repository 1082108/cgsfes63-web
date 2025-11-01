import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // ConsumerWidgetを使うために必要

//firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';

//notification
import 'screens/notification/notification_setup.dart';

//themes/
import 'themes/app_theme.dart';

import 'bottom_navigation.dart';
//screens/
import 'screens/home_screen.dart';
import 'screens/bunkasai/bunkasai_screen.dart';
import 'screens/zenkou/zenkoukikaku_screen.dart';
//notification/
import 'screens/notification/notification_detail_screen.dart';
import 'screens/notification/notification_screen.dart';
import 'screens/notification/send_notification_screen.dart';
//drawer/
import 'screens/drawer/contact_screen.dart';
import 'screens/drawer/information_screen.dart';
import 'screens/drawer/login_screen.dart';
import 'screens/drawer/pamphlet_screen.dart';
import 'screens/drawer/privacy_policy_screen.dart';
import 'screens/drawer/terms_of_service_screen.dart';
//home/
import 'screens/home/comment_box_screen.dart';
import 'screens/home/map_screen.dart';
//import 'screens/home/pr_video/pr_video_screen.dart';
import 'screens/home/schedule/schedule_screen.dart';
import 'screens/home/theme_song/theme_song_screen.dart';
//import 'screens/home/pr_video/show_pr_video_screen.dart';
//bunkasai/
import 'screens/bunkasai/tenji/tenji_detail_screen.dart';
import 'screens/bunkasai/engeki/engeki_detail_screen.dart';
import 'screens/bunkasai/yushi/yushi_detail_screen.dart';
import 'screens/bunkasai/bukatsu/bukatsu_detail_screen.dart';
//taiikusai/
import 'screens/taiikusai/taiikusai_detail_screen.dart';
import 'screens/taiikusai/result_screen.dart';
import 'screens/taiikusai/update_result_screen.dart';
import 'screens/taiikusai/taiikusai_screen.dart';
//zenkou/
import 'screens/zenkou/bihin_screen.dart';
import 'screens/zenkou/sanbon/sanbon_screen.dart';
import 'screens/zenkou/sanbon/sanbon_detail_screen.dart';
import 'screens/zenkou/encore/encore_screen.dart';
import 'screens/zenkou/utakai/utakai_screen.dart';
import 'screens/zenkou/utakai/utakai_detail_screen.dart';
import 'screens/zenkou/ff/ff_screen.dart';
import 'screens/zenkou/ff/mime_screen.dart';
import 'screens/zenkou/ff/hanabi_screen.dart';
//shift/
import 'screens/shift/shift_screen.dart';
import 'screens/shift/taiikusai/taiikusai_shift_screen.dart';
import 'screens/shift/bunkasai_shift_screen.dart';

//quiz
import 'data/quiz/quiz_page.dart'; 

// ★★★ Hyoji 関連のインポートとProviderのインポート ★★★
import 'screens/hyoji/hyoji_screen.dart'; 
import 'screens/hyoji/initialization_provider.dart'; 
// ★★★ ----------------------------------------- ★★★

void main() async {
  await _init();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // 💡 追加: 匿名サインイン処理
  try {
    await FirebaseAuth.instance.signInAnonymously();
    print("Firebase: Successfully signed in anonymously.");
  } catch (e) {
    print("Firebase Error: Anonymous sign-in failed: $e");
    // サインイン失敗は致命的なので、ここでエラーメッセージを表示するなどの対応が必要です
  }

  // ここに通知権限リクエストのコードを追加
  final messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  NotificationSetup.fcmSetup();
}

// 修正済み: StatelessWidgetからConsumerWidgetに変更
class MyApp extends ConsumerWidget { 
  const MyApp({super.key});

  @override
   Widget build(BuildContext context, WidgetRef ref) { 
    final termsAsyncValue = ref.watch(hasAgreedToTermsProvider);
    return MaterialApp(
      title: 'Chigusai App',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      themeMode: ThemeMode.system,
      home: termsAsyncValue.when(
        data: (hasAgreed) {
          if (hasAgreed) {
            // 同意済みならBottomNavigation（メインコンテンツ）を表示
            return BottomNavigation();
          } else {
            // 未同意なら注意事項画面（HyojiScreen）を表示
            return const HyojiScreen(); 
          }
        },
        loading: () => const Scaffold( // データロード中はローディング画面
          body: Center(child: CircularProgressIndicator()),
        ),
        error: (err, stack) => Scaffold( // エラーが発生した場合はエラー表示
          body: Center(child: Text('初期設定エラーが発生しました。$err')),
        ),
      ),
      
      routes: {
        // QuizPageのルーティング
        QuizPage.routeName: (ctx) => const QuizPage(), 
        
        // HyojiScreenのルーティングを追加
        HyojiScreen.routeName: (ctx) => const HyojiScreen(),
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        BunkasaiScreen.routeName: (ctx) => const BunkasaiScreen(),
        ZenkoukikakuScreen.routeName: (ctx) => const ZenkoukikakuScreen(),
        TaiikusaiScreen.routeName: (ctx) => const TaiikusaiScreen(),
        //notification
        NotificationScreen.routeName: (ctx) => const NotificationScreen(),
        NotificationDetailScreen.routeName: (ctx) => const NotificationDetailScreen(),
        SendNotificationScreen.routeName: (ctx) => const SendNotificationScreen(),
        //drawer
        ContactScreen.routeName: (ctx) => const ContactScreen(),
        InformationScreen.routeName: (ctx) => const InformationScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        PamphletScreen.routeName: (ctx) => const PamphletScreen(),
        PrivacyPolicyScreen.routeName: (ctx) => const PrivacyPolicyScreen(),
        TermsOfServiceScreen.routeName: (ctx) => const TermsOfServiceScreen(),
        //home
        CommentBoxScreen.routeName: (ctx) => const CommentBoxScreen(),
        MapScreen.routeName: (ctx) => const MapScreen(),
        ScheduleScreen.routeName: (ctx) => const ScheduleScreen(),
        ThemeSongScreen.routeName: (ctx) => const ThemeSongScreen(),
        //bunkasai
        TenjiDetailScreen.routeName: (ctx) => const TenjiDetailScreen(),
        EngekiDetailScreen.routeName: (ctx) => const EngekiDetailScreen(),
        YushiDetailScreen.routeName: (ctx) => const YushiDetailScreen(),
        BukatsuDetailScreen.routeName: (ctx) => const BukatsuDetailScreen(),
        //taiikusai/
        TaiikusaiDetailScreen.routeName: (ctx) => const TaiikusaiDetailScreen(),
        UpdateResultScreen.routeName: (ctx) => const UpdateResultScreen(),
        ResultScreen.routeName: (ctx) => const ResultScreen(),
        //zenkou/
        BihinScreen.routeName: (ctx) => const BihinScreen(),
        // ここは修正しました: SabbonScreen -> SanbonScreen
        SabbonScreen.routeName: (ctx) => const SabbonScreen(), 
        EncoreScreen.routeName: (ctx) => const EncoreScreen(),
        UtakaiScreen.routeName: (ctx) => const UtakaiScreen(),
        FFScreen.routeName: (ctx) => const FFScreen(),
        UtakaiDetailScreen.routeName: (ctx) => const UtakaiDetailScreen(),
        SanbonDetailScreen.routeName: (ctx) => const SanbonDetailScreen(),
        MimeScreen.routeName: (ctx) => const MimeScreen(),
        HanabiScreen.routeName: (ctx) => const HanabiScreen(),
        //shift/
        ShiftScreen.routeName: (ctx) => const ShiftScreen(),
        TaiikusaiShiftScreen.routeName: (ctx) => const TaiikusaiShiftScreen(),
        BunkasaiShiftScreen.routeName: (ctx) => const BunkasaiShiftScreen(),
      },
    );
  }
}