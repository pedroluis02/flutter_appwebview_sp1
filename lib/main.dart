import 'dart:async';

import 'package:flutter/material.dart';

import 'webview/base_webview.dart';
import 'webview_factory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyWebViewApp(initialUrl: 'https://flutter.dev'));
}

class MyWebViewApp extends StatelessWidget {
  final webViewFactory = MyViewViewFactory();
  final String? initialUrl;

  MyWebViewApp({Key? key, this.initialUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
     return WillPopScope(
       onWillPop: _onBackPressed,
       child: Scaffold(
         //appBar: AppBar(toolbarHeight: 0.1),
         body: SafeArea(
           child: FutureBuilder(
             future: webViewFactory.getWebView(
                 MyWebViewType.nativeWebView,
                 initialUrl: initialUrl,
             ),
             builder: _buildResult,
           ),
         ),
       ),
     );
   }

   Widget _buildResult(BuildContext context, AsyncSnapshot<MyBaseWebView> snapshot) {
     if (snapshot.hasData) {
       return snapshot.data!;
     } else{
       return const Text("Loading...");
     }
   }

   Future<bool> _onBackPressed() {
     return Future.value(false);
   }
}
