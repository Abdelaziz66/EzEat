import 'package:flutter/material.dart';

import '../widgets/thank_you_view_body.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.translate(
          offset: const Offset(0, -16), child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
            child: ThankYouViewBody(),
          )),
    );
  }
}
