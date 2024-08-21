import 'package:dartz/dartz.dart';
import 'package:ez_eat/core/errors/failure.dart';
import 'package:ez_eat/features/profile/domain/entities/address_entity.dart';

abstract class AddressRepo{
  Future<Either<Failure,List<AddressEntity>>> getAddress();
  Future<Either<Failure,void>> uploadAddress({required AddressEntity addressEntity});
}