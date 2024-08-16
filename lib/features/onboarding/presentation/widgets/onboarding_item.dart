import 'package:ez_eat/core/style/textStyles.dart';
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.imageName,
    required this.title,
    required this.subTitle,
  });

  final String imageName;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(
          flex: 2,
        ),
        Container(
          alignment: AlignmentDirectional.center,
          child: CircleAvatar(
            radius: 150,
            backgroundColor: Colors.black.withOpacity(.0),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Image.asset(
                'assets/images/onboarding/$imageName',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: Styles.onboardingTitle,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: Styles.onboardingSubTitle,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}