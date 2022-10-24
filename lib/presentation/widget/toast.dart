import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String message,
  required ToastState color,
}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseColor(color),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState { SUCESS, EROERR, WARNING }

Color chooseColor(ToastState choose) {
  Color color;
  switch (choose) {
    case ToastState.SUCESS:
      color = Colors.green;
      break;
    case ToastState.EROERR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}