import 'package:dartz/dartz.dart';

import 'package:ez_eat/core/errors/failure.dart';
import 'package:ez_eat/features/profile/data/data_sources/address_remote_data_source.dart';

import 'package:ez_eat/features/profile/domain/entities/address_entity.dart';

import '../../domain/repositories/address_repo.dart';
import '../data_sources/address_local_data_source.dart';

class AddressRepoImpl extends AddressRepo{
 final AddressRemoteDataSource addressRemoteDataSource;
 final AddressLocalDataSource addressLocalDataSource;

  AddressRepoImpl( {required this.addressRemoteDataSource,required this.addressLocalDataSource,});


  @override
  Future<Either<Failure, List<AddressEntity>>> getAddress() async {
    try{
      List<AddressEntity> addressEntity=[];
      addressEntity= await addressRemoteDataSource.getAddress();
      if(addressEntity.isNotEmpty){
        return right(addressEntity);
      }else{
        addressEntity= await addressLocalDataSource.getAddress();
        return right(addressEntity);
      }
    }catch (e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> uploadAddress({required AddressEntity addressEntity}) async{
    try{
      await addressRemoteDataSource.uploadAddress(addressEntity: addressEntity);
      return right(null);
    }catch (e){
      return left(ServerFailure(e.toString()));
    }
  }

}