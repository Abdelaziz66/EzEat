part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}


class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{
  final LoginEntity  loginEntity;

  LoginSuccessState({required this.loginEntity});
}
class LoginErrorState extends LoginState{
  final String errMessage;
  LoginErrorState(this.errMessage);
}


class ChangeEyeState extends LoginState{}
