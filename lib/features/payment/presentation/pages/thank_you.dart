import 'package:flutter/material.dart';

import '../widgets/thank_you_view_body.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: const Offset(0, -16), child: const ThankYouViewBody());
  }
}
