import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../../themes/app_color.dart';

class ContactScreen extends StatefulWidget {
  static const routeName = "/contact-screen";

  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
      ..loadRequest(Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLSeMywwMQKdMfcu62kKY1WMvE8rgsZIpERbdc0H7NtWDXtPg-g/viewform'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("お問い合わせ")),
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
