import 'package:dartz/dartz.dart';
import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class FoodRepo{
  Future<Either<Failure,List<FoodEntity>>> getFood();
}