import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:ez_eat/features/onboarding/presentation/pages/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/layout/presentation/pages/layout.dart';
import '../../features/login/presentation/pages/login.dart';
import '../../features/onboarding/presentation/pages/onboarding.dart';
import '../../features/payment/presentation/pages/thank_you.dart';
import '../../features/register/presentation/pages/register.dart';
import '../constants/constant.dart';
import '../widgets/food_details.dart';

abstract class AppRouter {
  static const kFoodDetails = '/FoodDetails';
  static const kLayout = '/Layout';
  static const kLogin = '/Login';
  static const kRegister = '/Register';
  static const kOnboarding = '/Onboarding';
  static const kLoginOrRegister = '/LoginOrRegister';
  static const kThankYou = '/ThankYou';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => isOnboarding!
            ? isSkip!
                ? const Layout()
                : isLogin!
                    ? const Layout()
                    : const LoginOrRegister()
            : const Onboarding(),
      ),
      GoRoute(
        path: kLayout,
        builder: (context, state) => const Layout(),
      ),
      GoRoute(
        path: kFoodDetails,
        pageBuilder: (context, state) {
          final Map<String, dynamic> extraData =
          state.extra as Map<String, dynamic>;
          final FoodEntity food =
          extraData['food'] as FoodEntity;

          return CustomTransitionPage(
          child: FoodDetails(food: food,),
          transitionDuration: const Duration(milliseconds: 300),
          fullscreenDialog: true,
          key: state.pageKey,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeIn).animate(animation),
              child: child,
            );
          },
        );}
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: kRegister,
        builder: (context, state) => const Register(),
      ),
      GoRoute(
        path: kOnboarding,
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: kLoginOrRegister,
        builder: (context, state) => const LoginOrRegister(),
      ),
      GoRoute(
        path: kThankYou,
        builder: (context, state) => const ThankYou(),
      ),
    ],
  );
}
