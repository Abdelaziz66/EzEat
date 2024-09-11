import 'package:ez_eat/features/favourite/domain/use_cases/add_to_favourite_usecase.dart';
import 'package:ez_eat/features/favourite/domain/use_cases/remove_from_favourite_usecase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'core/functions/hive_setup.dart';
import 'core/functions/setup_service_locator.dart';
import 'core/functions/system_ui_overlay_style.dart';
import 'core/style/dark_theme.dart';
import 'core/style/light_theme.dart';
import 'core/utils/api_keys.dart';
import 'core/utils/app_router.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'features/cart/data/repositories/cart_repo_impl.dart';
import 'features/cart/domain/use_cases/add_to_cart_usecase.dart';
import 'features/cart/domain/use_cases/remove_from_cart_usecase.dart';
import 'features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'features/dashboard/data/repositories/food_repo_impl.dart';
import 'features/dashboard/domain/use_cases/food_use_case.dart';
import 'features/dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'features/favourite/data/repositories/favourite_repo_impl.dart';
import 'features/favourite/presentation/manager/favourite_cubit/favourite_cubit.dart';
import 'features/payment/data/repositories/payment_repo_impl.dart';
import 'features/payment/domain/use_cases/payment_usecase.dart';
import 'features/payment/presentation/manager/payment_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  systemStatesNavigationBar();
  setupServiceLocator();
  await hiveSetup();
  Stripe.publishableKey = ApiKeys.publishKey;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DashboardCubit(
              foodUseCase: FoodUseCase(
                foodRepo: getIt.get<FoodRepoImpl>(),
              ),
            )..mainGetFood(),
          ),
          BlocProvider(
            create: (context) => FavouriteCubit(
              addToFavouriteUseCase: AddToFavouriteUseCase(
                  favouriteRepo:   getIt.get<FavouriteRepoImpl>()
              ),
              removeFromFavouriteUseCase: RemoveFromFavouriteUseCase(
                  favouriteRepo:   getIt.get<FavouriteRepoImpl>()
              ),
            ),
          ),
          BlocProvider(
            create: (context) => CartCubit(
              addToCartUseCase: AddToCartUseCase(
                cartRepo:  getIt.get<CartRepoImpl>(),
              ),
              removeFromCartUseCase: RemoveFromCartUseCase(
                cartRepo:   getIt.get<CartRepoImpl>(),
              ),
            ),
          ),
          BlocProvider(
            create: (context) =>
                PaymentCubit(
                    paymentUseCase:
                    PaymentUseCase(paymentRepo: PaymentRepoImpl()),),
          ),

        ],
        child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.light,
              routerConfig: AppRouter.router,
            ));
  }
}
