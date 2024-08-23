import 'package:ez_eat/core/functions/hive_function.dart';
import 'package:go_router/go_router.dart';

import '../../features/cart/presentation/manager/cart_cubit/cart_state.dart';
import '../../features/dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import '../../features/favourite/presentation/manager/favourite_cubit/favourite_state.dart';
import '../../features/login/presentation/manager/login_cubit/login_cubit.dart';
import '../constants/constant.dart';
import '../utils/app_router.dart';

void logout(context) {
  isLogin = false;
  uId = null;
  save('isLogin', false, kStartBox);
  save('uId', null, kStartBox);
  ChangeFavouriteSuccessState.favourite = [];
  ChangeCartSuccessState.cart = [];
  DashboardCubit.get(context).foods = [];
  LoginSuccessState.loginEntity = null;
  delete(kFoodBox);
  delete(kUserBox);
  GoRouter.of(context).go(AppRouter.kLoginOrRegister);
}