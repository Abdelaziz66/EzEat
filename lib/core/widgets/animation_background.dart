import 'package:ez_eat/core/widgets/blur_layer.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/widgets.dart' as flutter;
class AnimationBackground extends StatelessWidget {
  const AnimationBackground({
    super.key, required this.widget,
  });
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          width: MediaQuery.of(context).size.width * 5,
          left: -1000,
          bottom: -900,
          child: flutter.Image.asset(
            "assets/images/background/Spline.png",
          ),
        ),
        const RiveAnimation.asset(
          "assets/images/rive/shapes.riv",
        ),
        const BlurLayer(),
        widget,
      ],
    );
  }
}