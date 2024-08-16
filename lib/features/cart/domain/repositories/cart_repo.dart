import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';


abstract class CartRepo{
  Future<Either<Failure, void>>addToCart({required String itemId});
  Future<Either<Failure, void>>removeFromCart({required String itemId});
}