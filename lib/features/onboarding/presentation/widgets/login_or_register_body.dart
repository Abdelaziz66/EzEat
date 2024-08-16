import 'package:ez_eat/core/style/textStyles.dart';
import 'package:ez_eat/core/widgets/animation_background.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';


class LoginOrRegisterBody extends StatelessWidget {
  const LoginOrRegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationBackground(widget:  SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kLayout);
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 8,),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: AlignmentDirectional.center,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width*.4,
                  backgroundColor: Colors.black.withOpacity(.05),
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Image.asset(
                      'assets/images/onboarding/login.png',

                    ),
                  ),
                ),
              ),
            ),
             const Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hello Again!',
                        style:Styles.onboardingTitle
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'You can skip Register and Login',
                        style:Styles.onboardingSubTitle,
                      ),
                    ],
                  ),
                )),
            Padding(
              padding:
              const EdgeInsets.only(left: 30, right: 30, bottom: 40),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white24,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kRegister);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadiusDirectional.circular(20),
                            color: Colors.white.withOpacity(.4),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Text(
                                'Register',
                                style: Styles.textStyle20
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kLogin);
                        },
                        child: const SizedBox(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Text(
                                'Login',
                                style:Styles.textStyle20
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  
  }
}
