import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'base_webview.dart';

class MyInAppWebView extends MyBaseWebView {
  const MyInAppWebView({Key? key, String? initialUrl})
      : super(key: key, initialUrl: initialUrl);

  @override
  _ViewState createState() => _ViewState();

  @override
  Future<void> setup() async {
    if (Platform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    }
  }
}

class _ViewState extends State<MyInAppWebView> {
  InAppWebViewController? webViewController;

  InAppWebViewGroupOptions? options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      )
  );

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(widget.initialUrl!)),
      initialOptions: options,
      onWebViewCreated: (controller) => webViewController = controller,
    );
  }
}