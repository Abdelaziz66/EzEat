import 'package:get_it/get_it.dart';

import '../../features/dashboard/data/data_sources/food_local_data_scource.dart';
import '../../features/dashboard/data/data_sources/food_remote_data_source.dart';
import '../../features/dashboard/data/repositories/food_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FoodRepoImpl>(
    FoodRepoImpl(
      foodRemoteDataSource: FoodRemoteDataSourceImpl(),
      foodLocalDataSource: FoodLocalDataSourceImpl(),
    ),
  );

}
