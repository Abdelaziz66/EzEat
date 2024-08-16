import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class FavouriteRepo{
  Future<Either<Failure, void>>addToFavourite({required String itemId});
  Future<Either<Failure, void>>removeFromFavourite({required String itemId});
}