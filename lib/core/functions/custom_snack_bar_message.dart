import 'package:flutter/material.dart';

showSnackBar({required context, required String message}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(

       behavior: SnackBarBehavior.fixed,
       duration: const Duration(seconds: 2),
        content: Text(
          message,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
