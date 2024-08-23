import 'package:dartz/dartz.dart';
import 'package:ez_eat/core/errors/failure.dart';
import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:ez_eat/features/dashboard/domain/repositories/food_repo.dart';
import '../data_sources/food_local_data_source.dart';
import '../data_sources/food_remote_data_source.dart';

class FoodRepoImpl extends FoodRepo {
  final FoodRemoteDataSource foodRemoteDataSource;
  final FoodLocalDataSource foodLocalDataSource;

  FoodRepoImpl({required this.foodRemoteDataSource,required this.foodLocalDataSource});
  @override
  Future<Either<Failure, List<FoodEntity>>> getFood() async {
    try {
      List<FoodEntity> food=[];
      food=foodLocalDataSource.getFood();
      if(food.isNotEmpty){
        return right(food);
      }
      food = await foodRemoteDataSource.getFood();
      return right(food);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }



}
