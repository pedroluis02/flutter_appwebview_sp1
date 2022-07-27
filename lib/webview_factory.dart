import 'webview/inapp_webview.dart';
import 'webview/native_webview.dart';

import 'webview/base_webview.dart';

enum MyWebViewType {
  nativeWebView,
  inAppWebView,
}

class MyViewViewFactory {
  Future<MyBaseWebView> getWebView(MyWebViewType type, {String? initialUrl}) async {
    MyBaseWebView webView;

    switch(type) {
      case MyWebViewType.inAppWebView:
        webView = MyInAppWebView(initialUrl: initialUrl);
        break;

      default:
        webView = MyEmbeddedWebView(initialUrl: initialUrl);
    }

    await webView.setup();

    return webView;
  }
}