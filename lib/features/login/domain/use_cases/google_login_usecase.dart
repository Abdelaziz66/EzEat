import 'package:dartz/dartz.dart';
import 'package:ez_eat/core/errors/failure.dart';
import 'package:ez_eat/core/use_cases/use_case.dart';
import 'package:ez_eat/features/login/domain/entities/login_entity.dart';

import '../repositories/login_repo.dart';


class GoogleLoginUseCase extends UseCase<void,NoParam>{
 final LoginRepo loginRepo;


 GoogleLoginUseCase({required this.loginRepo});
  @override
  Future<Either<Failure, LoginEntity>> call([NoParam? param]) {
  return loginRepo.googleLogin();
  }

}
