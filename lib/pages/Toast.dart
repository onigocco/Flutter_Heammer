import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;

class Toast {
  static showToast(String msg) {
    fluttertoast.Fluttertoast.showToast(
        msg: msg,
        toastLength: fluttertoast.Toast.LENGTH_SHORT,
        timeInSecForIos: 2,
        fontSize: 16,
        gravity: fluttertoast.ToastGravity.CENTER,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }
}
