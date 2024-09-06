import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ez_eat/core/functions/custom_snack_bar_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/style/textStyles.dart';
import '../../../../core/widgets/glass_box.dart';

class VerifyAccount extends StatelessWidget {
  const VerifyAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition:
        FirebaseAuth.instance.currentUser?.emailVerified ==
            false,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: GlassBox(
            widget: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: Colors.deepOrange,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Verify your account',
                    style: Styles.textStyle16black
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        showSnackBar(context: context, message: 'coming soon :)');

                      },
                      child: Text(
                        'Send',
                        style: Styles.textStyle16.copyWith(color: Colors.teal[400])
                      )),
                  IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(
                        Icons.restart_alt,
                        color: Colors.black54,
                      )),
                ],
              ),
            ),
            color: Colors.white.withOpacity(.3),
            borderRadius: 20,
            x: 40,
            y: 40, border: false,),
        ),
        fallback: (context) => const SizedBox(
          height: 0,
        ));
  }
}
