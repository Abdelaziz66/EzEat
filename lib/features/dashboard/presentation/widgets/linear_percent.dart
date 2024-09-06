import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/style/textStyles.dart';
import 'custom_linear_percent.dart';

class LinearPercent extends StatelessWidget {
  const LinearPercent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 0, bottom: 8),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.black.withOpacity(.05),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Column(
              children: [
                LinearPercentIndicator(
                  percent: .75,
                  backgroundColor: Colors.black12,
                  progressColor: Colors.black,
                  leading: const Text(
                    '0',
                    style: Styles.textStyle12,
                  ),
                  center: Text(
                    '850 Calories',
                    style: Styles.textStyle12.copyWith(color: Colors.white),
                  ),
                  trailing: const Text(
                    '1000',
                    style: Styles.textStyle12,
                  ),
                  barRadius: const Radius.circular(20),
                  lineHeight: 20,
                  animation: true,
                  animationDuration: 1500,
                  curve: Curves.easeOutBack,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomLinear(
                  head: 'Protein',
                  tail: '100 %',
                  percent: .75,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomLinear(
                  head: 'Carb',
                  tail: '100 %',
                  percent: .5,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomLinear(
                  head: 'Fats',
                  tail: '100 %',
                  percent: .25,
                ),
              ],
            ),
          )),
    );
  }
}
