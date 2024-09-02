import 'package:flutter/material.dart';
showSnackBar({required context, required String message}) =>
    ScaffoldMessenger.of(context)
        .showSnackBar( SnackBar(content: Text(message)));
