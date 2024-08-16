import 'package:flutter/material.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs({
    super.key, required this.imagepath, required this.index, required this.tabIndex,
  });
  final String imagepath;
  final int index;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: index == tabIndex ? Colors.black : Colors.white.withOpacity(.3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset(
          'assets/images/$imagepath',
          color:index == tabIndex?Colors.white:Colors.black,


        ),
      ),
    );
  }
}