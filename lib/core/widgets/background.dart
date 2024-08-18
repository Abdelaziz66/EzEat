import 'package:ez_eat/core/widgets/blur_layer.dart';
import 'package:flutter/material.dart';

import 'background_shape.dart';

class BackGround extends StatelessWidget {
  const BackGround({
    super.key, required this.widget,
  });
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGroundShape(),
        const BlurLayer(),
        widget,
      ],
    );
  }
}

