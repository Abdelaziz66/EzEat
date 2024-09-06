import 'package:dartz/dartz.dart';
import 'package:ez_eat/features/login/domain/entities/login_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/login_model.dart';

abstract class LoginRepo{

  Future<Either<Failure,LoginEntity>> login({required LoginDataModel loginDataModel,});
  Future<Either<Failure,LoginEntity>> googleLogin();
}