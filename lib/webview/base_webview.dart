import 'package:flutter/material.dart';

abstract class MyBaseWebView extends StatefulWidget {
  final String? initialUrl;
  const MyBaseWebView({Key? key, this.initialUrl}) : super(key: key);

  Future<void> setup();
}
