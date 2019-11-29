import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar({Key key, String titleText, String backgroundImagePath})
      : super(
            key: key,
            preferredSize: Size.fromHeight(44),
            child: AppBar(
              brightness: Brightness.dark,
                title: Text(titleText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                centerTitle: false,
                flexibleSpace: ConstrainedBox(
                  child: Image(
                    image: AssetImage(backgroundImagePath),
                    fit: BoxFit.cover,
                  ),
                  constraints: new BoxConstraints.expand(),
                ),
                backgroundColor: Colors.transparent));
}
