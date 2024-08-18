import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/style/textStyles.dart';

class CustomLinear extends StatelessWidget {
  const CustomLinear({super.key,
    required this.head,
    required this.tail,
    required this.percent,
  });
  final String head;
  final String tail;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 50),
      child: LinearPercentIndicator(
        percent: percent,
        backgroundColor: Colors.black12,
        progressColor: Colors.black54,
        leading: SizedBox(
          width: 42,
          child: Text(
            head,
            style: Styles.textStyle12,
          ),
        ),
        trailing: Text(
          tail,
          style: Styles.textStyle12,
        ),
        barRadius: const Radius.circular(20),
        lineHeight: 5,
        animation: true,
        animationDuration: 1500,
        curve: Curves.easeOutBack,
      ),
    );
  }
}