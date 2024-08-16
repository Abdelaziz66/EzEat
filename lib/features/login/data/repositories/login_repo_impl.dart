import 'package:dartz/dartz.dart';
import 'package:ez_eat/core/errors/failure.dart';
import 'package:ez_eat/features/login/domain/entities/login_entity.dart';


import '../../domain/repositories/login_repo.dart';
import '../data_sources/login_remote_data_source.dart';
import '../models/login_model.dart';

class LoginRepoImpl extends LoginRepo{
 final LoginRemoteDataSource loginRemoteDataSource;


  LoginRepoImpl( {required this.loginRemoteDataSource,});

  @override
  Future<Either<Failure, LoginEntity>> login({required LoginDataModel loginDataModel}) async {
    try{
      LoginEntity loginEntity =await loginRemoteDataSource.login(loginDataModel:loginDataModel);
      return right(loginEntity);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
 

  
}