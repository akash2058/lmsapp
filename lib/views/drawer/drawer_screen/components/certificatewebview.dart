import 'package:flutter/material.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CertificateWebView extends StatefulWidget {
  final String url;
  final String title;
  const CertificateWebView({super.key, required this.url, required this.title});

  @override
  State<CertificateWebView> createState() => _CertificateWebViewState();
}

class _CertificateWebViewState extends State<CertificateWebView> {
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
            if (request.url.startsWith(widget.url)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(autoapply: true, title: widget.title),
        body: WebViewWidget(controller: controller));
  }
}
