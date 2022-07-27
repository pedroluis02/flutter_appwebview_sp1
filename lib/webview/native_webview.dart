import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'base_webview.dart';

class MyEmbeddedWebView extends MyBaseWebView {
  const MyEmbeddedWebView({Key? key, String? initialUrl})
      : super(key: key, initialUrl: initialUrl);

  @override
  _ViewState createState() => _ViewState();

  @override
  Future<void> setup() async {
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }
}

class _ViewState extends State<MyEmbeddedWebView> {
  WebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.initialUrl,
      debuggingEnabled: true,
      gestureNavigationEnabled: true,
      allowsInlineMediaPlayback: true,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) => webViewController = controller,
    );
  }
}