import 'package:flutter/material.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckOutPage extends StatefulWidget {
  final String id;
  CheckOutPage({super.key, required this.id});

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(
                'https://lms.hirephpdeveloperindia.com/web-checkout?id=${widget.id}')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://lms.hirephpdeveloperindia.com/web-checkout?id=${widget.id}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(autoapply: true, title: 'Checkout'),
      body: WebViewWidget(controller: controller),
    );
  }
}
