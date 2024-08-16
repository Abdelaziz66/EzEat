import 'package:ez_eat/core/widgets/blur_layer.dart';
import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({
    super.key, required this.widget,
  });
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*.13,
          decoration: const BoxDecoration(
            color: Color(0xFFFCB0AA),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(

                height:MediaQuery.of(context).size.height*.25,
                decoration: const BoxDecoration(
                  color: Color(0xFFFCB0AA),
                ),
              ),
            ),
            Expanded(
              child: Container(

                height:MediaQuery.of(context).size.height*.25,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFA39792),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Container(
                width: MediaQuery.of(context).size.width*.40,
                height: MediaQuery.of(context).size.height*.20,
                decoration: const BoxDecoration(
                  color: Color(0xFFFCB0AA),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*.40,
              height: MediaQuery.of(context).size.height*.20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,

                color: Color(0xFFFAE8DF),
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width*.85,
            decoration: const BoxDecoration(
              color: Color(0xFFF2D0A3),
            ),
          ),
        ),
      ],
    ),
        const BlurLayer(),
        widget,
      ],
    );
  }
}