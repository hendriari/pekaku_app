import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future toastAllert(
  String msg,
  Color backgroundColor,
  int durasi,
) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: durasi,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
