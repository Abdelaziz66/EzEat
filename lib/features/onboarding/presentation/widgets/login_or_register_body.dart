import 'package:ez_eat/core/style/textStyles.dart';
import 'package:ez_eat/core/widgets/animation_background.dart';
import 'package:ez_eat/features/dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/functions/save_food.dart';
import '../../../../core/utils/app_router.dart';


class LoginOrRegisterBody extends StatelessWidget {
  const LoginOrRegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnimationBackground(widget:  SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            _Skip(),
            _Image(),
             _Hello(),
            _CustomButton(),
          ],
        ),
      ),
    ));
  
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width<600? MediaQuery.of(context).size.width: 600,

      child: Padding(
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
    );
  }
}

class _Hello extends StatelessWidget {
  const _Hello();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
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
       ));
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: MediaQuery.of(context).size.height*.5,
      child: AspectRatio(
        aspectRatio: .8/1,

        child: Container(
          alignment: AlignmentDirectional.center,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/images/onboarding/login.png',

            ),
          ),
        ),
      ),
    );
  }
}

class _Skip extends StatelessWidget {
  const _Skip();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        TextButton(
          onPressed: () {
            isSkip=true;
            isMainGetFood=false;
            save('skip',isSkip,kStartBox);
            GoRouter.of(context).go(AppRouter.kLayout);
            DashboardCubit.get(context).getFood(text: 'Get Food From Skip');

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
    );
  }
}
