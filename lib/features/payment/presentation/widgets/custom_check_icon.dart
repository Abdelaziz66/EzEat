import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 40,
      backgroundColor: Colors.white24,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Color(0xff34A853),
        child: Icon(
          Icons.check,
          size: 40,
        ),
      ),
    );
  }
}
