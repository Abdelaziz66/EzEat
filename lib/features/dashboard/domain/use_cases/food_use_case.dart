import 'package:dartz/dartz.dart';
import 'package:ez_eat/core/errors/failure.dart';
import 'package:ez_eat/features/dashboard/domain/repositories/food_repo.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/food_entity.dart';

class FoodUseCase extends UseCase<List<FoodEntity>, NoParam> {
  final FoodRepo foodRepo;

  FoodUseCase({required this.foodRepo});

  @override
  Future<Either<Failure, List<FoodEntity>>> call([NoParam? param]) async {
    return await foodRepo.getFood();
  }
}
