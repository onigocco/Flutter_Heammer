import 'package:flutter/material.dart';
import 'package:heammer/pages/CustomAppBar.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePage createState() => _MessagePage();
}

class _MessagePage extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: 'Inbox',
          backgroundImagePath: 'assets/images/appbar_backgoung.png'),
      body: Container(),
    );
  }
}
