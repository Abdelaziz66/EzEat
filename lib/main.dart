import 'package:ez_eat/features/favourite/data/data_sources/favourite_remote_data_source.dart';
import 'package:ez_eat/features/favourite/domain/repositories/favourite_repo.dart';
import 'package:ez_eat/features/favourite/domain/use_cases/add_to_favourite_usecase.dart';
import 'package:ez_eat/features/favourite/domain/use_cases/remove_from_favourite_usecase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/functions/hive_setup.dart';
import 'core/functions/setup_service_locator.dart';
import 'core/functions/systemUI.dart';
import 'core/style/dark_theme.dart';
import 'core/style/light_theme.dart';
import 'core/utils/app_router.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'features/dashboard/data/repositories/food_repo_impl.dart';
import 'features/dashboard/domain/use_cases/food_usecase.dart';
import 'features/dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'features/favourite/data/repositories/Favourite_repo_impl.dart';
import 'features/favourite/presentation/manager/favourite_cubit/favourite_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  systemStatesNavigationBar();
  setupServiceLocator();
  await hiveSetup();
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
            )..getFood(),
          ),
          BlocProvider(
          create: (context) => FavouriteCubit(addToFavouriteUseCase: AddToFavouriteUseCase(
          favouriteRepo: FavouriteRepoImpl(favouriteRemoteDataSource: FavouriteRemoteDataSourceImpl()),
          ), removeFromFavouriteUseCase: RemoveFromFavouriteUseCase(favouriteRepo: FavouriteRepoImpl(
          favouriteRemoteDataSource: FavouriteRemoteDataSourceImpl(),
          ),),
          ),

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
