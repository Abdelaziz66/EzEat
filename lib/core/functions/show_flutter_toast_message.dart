import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

 showFlutterToastMessage({required String message}) {
  return  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.blueGrey,
      textColor: Colors.white,
      fontSize: 16.0);
}
