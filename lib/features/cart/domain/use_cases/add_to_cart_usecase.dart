import 'package:dartz/dartz.dart';
import 'package:ez_eat/core/errors/failure.dart';
import 'package:ez_eat/core/use_cases/use_case.dart';

import '../repositories/cart_repo.dart';

class AddToCartUseCase extends UseCase<void,String>{
  final CartRepo cartRepo;

  AddToCartUseCase({required this.cartRepo});

  @override
  Future<Either<Failure, void>> call([String? itemId])async {
    return cartRepo.addToCart(itemId: itemId!);
  }


}