import 'package:dartz/dartz.dart';

import 'package:ez_eat/core/errors/failure.dart';
import 'package:ez_eat/features/profile/domain/repositories/address_repo.dart';

import '../../../../core/use_cases/use_case.dart';
import '../entities/address_entity.dart';

class GetAddressUseCase extends UseCase<List<AddressEntity>,NoParam>{
 final  AddressRepo addressRepo;

  GetAddressUseCase({required this.addressRepo});
  @override
  Future<Either<Failure, List<AddressEntity>>> call([NoParam? param])async {
   return await addressRepo.getAddress();
  }

}