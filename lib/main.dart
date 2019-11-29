import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heammer/pages/CustomRoute.dart';
import 'package:heammer/pages/MainPage.dart';

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeammerApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MainPage(),
      routes: CustomRoute.routes,
    );
  }
}

void main() {
  runZoned(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
      return Text(
          details.exception.toString() + "\n " + details.stack.toString());
    };
    runApp(MyApp());
  }, onError: (Object obj, StackTrace stack) {
    print(obj);
    print(stack);
  });
}
