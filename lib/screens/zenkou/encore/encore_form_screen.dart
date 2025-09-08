import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../../themes/app_color.dart';

class EncoreFormScreen extends StatefulWidget {
  static const routeName = "/encore-screen";

  const EncoreFormScreen({super.key});

  @override
  State<EncoreFormScreen> createState() => _EncoreFormScreenState();
}

class _EncoreFormScreenState extends State<EncoreFormScreen> {
  bool _pageIsLoading = true;
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String utl) {
            setState(() {
              _pageIsLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLSctMTCUNsjOKDK1FxPT8j7eFVq49QSSWs5hBkcYs_Hoh8eYLg/viewform'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("アンコールステージ")),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_pageIsLoading)
            Container(
              height: double.infinity,
              width: double.infinity,
              color: AppColors.scaffoldBackgroundColor,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
