import 'package:dartz/dartz.dart';
import 'package:ez_eat/core/errors/failure.dart';
import 'package:ez_eat/core/use_cases/use_case.dart';
import 'package:ez_eat/features/login/domain/entities/login_entity.dart';
import '../../data/models/login_model.dart';
import '../repositories/login_repo.dart';

class LoginUseCase extends UseCase<void, LoginDataModel> {
  final LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});
  @override
  Future<Either<Failure, LoginEntity>> call([LoginDataModel? param]) {
    return loginRepo.login(loginDataModel: param!);
  }
}
