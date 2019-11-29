import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heammer/pages/VideoItem.dart';
import 'VideoPlayPage.dart';

class CustomRoute {
  static Map<String, WidgetBuilder> routes = {};

  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static goVideoPlay(BuildContext context, VideoItem item) {
    return Navigator.push(
        context, CupertinoPageRoute(builder: (context) => VideoPlayPage(item)));
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
