import 'package:flutter/material.dart';

import '../../../data/bunkasai/engeki_data.dart';

class EngekiDetailScreen extends StatelessWidget {
  static const routeName = "/engeki-detail-screen";
  const EngekiDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bunkasaiDetailData = ModalRoute.of(context)!.settings.arguments as EngekiDetailData;
    return Scaffold(
      appBar: AppBar(title: const Text("演劇詳細")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20), // 最初の画像表示部分のスペース
              Text("${bunkasaiDetailData.hr}「${bunkasaiDetailData.title}」", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(
                "日時：${bunkasaiDetailData.startTime.getDayAsString()}  ${bunkasaiDetailData.startTime.getTimeAsString()} 〜 ${bunkasaiDetailData.endTime.getTimeAsString()}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 15),
              Text(bunkasaiDetailData.pr, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 15),
              
              // 画像表示部分をすべて削除
            ],
          ),
        ),
      ),
    );
  }
}
