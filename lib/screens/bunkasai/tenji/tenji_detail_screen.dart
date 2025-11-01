import 'package:flutter/material.dart';

import '../../../widgets/image_viewer.dart';
import '../../../data/bunkasai/tenji_data.dart';

// 💡 修正点: 整理券ステータス表示ウィジェットをインポートします
import '../../ticket_status_widget.dart'; 

class TenjiDetailScreen extends StatelessWidget {
  static const routeName = "/tenji-detail-screen";
  const TenjiDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ModalRouteから展示データを取得
    final tenjiDetailData = ModalRoute.of(context)!.settings.arguments as TenjiDetailData;
    
    // 💡 整理券ウィジェットに渡すための展示IDと名称をデータから抽出
    final String tenjiId = tenjiDetailData.hr + tenjiDetailData.title; 
    final String tenjiName = "${tenjiDetailData.hr}「${tenjiDetailData.title}」";

    return Scaffold(
      appBar: AppBar(title: const Text("展示詳細")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageViewer(imgPath: tenjiDetailData.imgPath),
              const SizedBox(height: 20),
              
              Text(tenjiName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(tenjiDetailData.pr, style: const TextStyle(fontSize: 18)),

              const SizedBox(height: 30),
              
              // 💡 整理券ステータスウィジェットを挿入
              // この部分のエラーが解消されます。
              TicketStatusWidget(
                tenjiId: tenjiId, // Firestoreでの識別子
                tenjiName: tenjiName, // 表示用の名称
              ),

              const SizedBox(height: 20),
              
              // FilledButton(onPressed: () {}, child: const Text("マップ")),
            ],
          ),
        ),
      ),
    );
  }
}
