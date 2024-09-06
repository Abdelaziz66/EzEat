import 'package:dartz/dartz.dart';
import 'package:ez_eat/core/errors/failure.dart';
import 'package:ez_eat/core/use_cases/use_case.dart';
import '../repositories/favourite_repo.dart';

class AddToFavouriteUseCase extends UseCase<void,String>{
  final FavouriteRepo favouriteRepo;
  AddToFavouriteUseCase({required this.favouriteRepo});

  @override
  Future<Either<Failure, void>> call([String? itemId])async {
    return favouriteRepo.addToFavourite(itemId: itemId!);
  }


}