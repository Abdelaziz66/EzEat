
import 'package:ez_eat/features/onboarding/presentation/pages/login_or_register.dart';
import 'package:go_router/go_router.dart';

import '../../features/layout/presentation/pages/layout.dart';
import '../../features/login/presentation/pages/login.dart';
import '../../features/onboarding/presentation/pages/onboarding.dart';
import '../../features/register/presentation/pages/register.dart';
import '../constants/constant.dart';


abstract class AppRouter {
  static const kFoodDetails = '/FoodDetails';
  static const kLayout = '/Layout';
  static const kLogin = '/Login';
  static const kRegister = '/Register';
  static const kOnboarding = '/Onboarding';
  static const kLoginOrRegister = '/LoginOrRegister';
    static final router = GoRouter(
    routes: [

      GoRoute(
        path: '/',
        builder: (context, state) =>isOnboarding == false? const Onboarding():isLogin ==false ?const LoginOrRegister():const Layout(),
      ),
      GoRoute(
        path: kLayout,
        builder: (context, state) => const Layout(),
      ),
      // GoRoute(
      //   path: kFoodDetails,
      //   builder: (context, state) => const FoodDetails(),
      // ),
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
    ],
  );
}
