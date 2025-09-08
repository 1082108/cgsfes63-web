import 'package:flutter/material.dart';

class MimeScreen extends StatelessWidget {
  static const routeName = "/mime-screen";
  const MimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("スケジュール（予定）"),
      ),
      body: InteractiveViewer(
        child: Center(child: Image.asset("assets/images/yotei.png")),
      ),
    );
  }
}
