import 'package:ez_eat/core/functions/hive_function.dart';
import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:ez_eat/features/login/domain/entities/login_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../../features/cart/presentation/manager/cart_cubit/cart_state.dart';
import '../../features/dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import '../../features/favourite/presentation/manager/favourite_cubit/favourite_state.dart';
import '../../features/login/presentation/manager/login_cubit/login_cubit.dart';
import '../../features/profile/domain/entities/address_entity.dart';
import '../constants/constant.dart';
import '../utils/app_router.dart';

void logout(context) {
  isLogin = false;
  uId = null;
  customerId=null;
  save('isLogin', false, kStartBox);
  save('uId', null, kStartBox);
  save('id', null, kStartBox);
  ChangeFavouriteSuccessState.favourite = [];
  ChangeCartSuccessState.cart = [];
  DashboardCubit.get(context).foods = [];
  LoginSuccessState.loginEntity = null;
  Hive.box<FoodEntity>(kFoodBox).clear();
  Hive.box<LoginEntity>(kUserBox).clear();
  Hive.box<AddressEntity>(kAddressBox).clear();
  GoRouter.of(context).go(AppRouter.kLoginOrRegister);
}