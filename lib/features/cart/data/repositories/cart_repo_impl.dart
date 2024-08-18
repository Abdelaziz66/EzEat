import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repositories/cart_repo.dart';
import '../data_sources/cart_remote_data_source.dart';

class CartRepoImpl extends CartRepo{
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImpl({required this.cartRemoteDataSource});
  @override
  Future<Either<Failure, void>> addToCart({required String itemId}) async{
    try{
     await cartRemoteDataSource.addToCart(itemId: itemId);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart({required String itemId}) async{
    try{
      await cartRemoteDataSource.removeFromCart(itemId: itemId);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }



}