import 'package:flutter/material.dart';
import 'package:flutter_appwebview_sp1/webview/base_webview.dart';
import 'package:flutter_appwebview_sp1/webview/native_webview.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_appwebview_sp1/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    const url = 'https://pub.dev';
    const webView = MyEmbeddedWebView(initialUrl: url);
    await tester.pumpWidget(webView);
  });
}
