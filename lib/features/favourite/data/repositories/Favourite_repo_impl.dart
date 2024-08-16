import 'package:dartz/dartz.dart';
import 'package:ez_eat/features/favourite/data/data_sources/favourite_remote_data_source.dart';
import 'package:ez_eat/features/favourite/domain/repositories/favourite_repo.dart';

import '../../../../core/errors/failure.dart';

class FavouriteRepoImpl extends FavouriteRepo{
  final FavouriteRemoteDataSource favouriteRemoteDataSource;

  FavouriteRepoImpl({required this.favouriteRemoteDataSource});
  @override
  Future<Either<Failure, void>> addToFavourite({required String itemId}) async{
    try{
     await favouriteRemoteDataSource.addToFavourite(itemId: itemId);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromFavourite({required String itemId}) async{
    try{
      await favouriteRemoteDataSource.removeFromFavourite(itemId: itemId);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

}