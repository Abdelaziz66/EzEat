import 'package:go_router/go_router.dart';
import '../../features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import '../../features/cart/presentation/manager/cart_cubit/cart_state.dart';
import '../../features/dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import '../../features/favourite/presentation/manager/favourite_cubit/favourite_cubit.dart';
import '../../features/favourite/presentation/manager/favourite_cubit/favourite_state.dart';
import '../../features/login/presentation/manager/login_cubit/login_cubit.dart';
import '../constants/constant.dart';
import '../utils/app_router.dart';
import 'custom_snack_bar_message.dart';
import 'hive_function.dart';

void loginSuccess(LoginSuccessState state, context) async {
  showSnackBar(message: 'Login Successful', context: context);
  save('isLogin', true, kStartBox);
  save('uId', LoginSuccessState.loginEntity?.uid, kStartBox);
  save('isSkip', false, kStartBox);
  save('id', LoginSuccessState.loginEntity?.id, kStartBox);
  isSkip = false;
  isLogin = true;
  loginEntity = LoginSuccessState.loginEntity;
  uId = LoginSuccessState.loginEntity?.uid;
  customerId = LoginSuccessState.loginEntity?.id;
  isMainGetFood = false;
  await uploadLocalFavouriteCart(context);
  GoRouter.of(context).go(AppRouter.kLayout);
  DashboardCubit.get(context).getFood();
}

Future<void> uploadLocalFavouriteCart(context) async {
  if (ChangeCartSuccessState.cart.isNotEmpty ||
      ChangeFavouriteSuccessState.favourite.isNotEmpty) {
    showSnackBar(message: 'Connecting your last activity', context: context);
    for (int i = 0; i < ChangeCartSuccessState.cart.length; i++) {
      await CartCubit.get(context)
          .addToCartCloud(food: ChangeCartSuccessState.cart[i]);
    }
    for (int i = 0; i < ChangeFavouriteSuccessState.favourite.length; i++) {
      await FavouriteCubit.get(context).addToFavouriteCloud(
        food: ChangeFavouriteSuccessState.favourite[i],
      );
    }
  }
  DashboardCubit.get(context).foods = [];
  ChangeCartSuccessState.cart = [];
  ChangeFavouriteSuccessState.favourite = [];
}
