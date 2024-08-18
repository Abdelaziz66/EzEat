import 'package:get_it/get_it.dart';

import '../../features/cart/data/data_sources/cart_remote_data_source.dart';
import '../../features/cart/data/repositories/cart_repo_impl.dart';
import '../../features/dashboard/data/data_sources/food_local_data_source.dart';
import '../../features/dashboard/data/data_sources/food_remote_data_source.dart';
import '../../features/dashboard/data/repositories/food_repo_impl.dart';
import '../../features/favourite/data/data_sources/favourite_remote_data_source.dart';
import '../../features/favourite/data/repositories/favourite_repo_impl.dart';
import '../../features/login/data/data_sources/login_remote_data_source.dart';
import '../../features/login/data/repositories/login_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {


  getIt.registerSingleton<FoodRepoImpl>(
    FoodRepoImpl(
      foodRemoteDataSource: FoodRemoteDataSourceImpl(),
      foodLocalDataSource: FoodLocalDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<FavouriteRepoImpl>(
    FavouriteRepoImpl(
        favouriteRemoteDataSource: FavouriteRemoteDataSourceImpl()),
  );

  getIt.registerSingleton<CartRepoImpl>(

    CartRepoImpl(
        cartRemoteDataSource: CartRemoteDataSourceImpl()),

  );

  getIt.registerSingleton<LoginRepoImpl>(

      LoginRepoImpl(
          loginRemoteDataSource: LoginRemoteDataSourceImpl()),
  );
}
