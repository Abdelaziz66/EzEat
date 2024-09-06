import 'package:flutter/material.dart';
import '../../../../core/style/textStyles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value});

  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Styles.textStyle25,
          ),
          const Spacer(),
          Text(
            value,
            textAlign: TextAlign.center,
            style: Styles.textStyle25,
          )
        ],
      ),
    );
  }
}
