import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/google_auth.dart';
import '../../../data/models/login_model.dart';
import '../../../domain/entities/login_entity.dart';
import '../../../domain/use_cases/login_usecase.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  final LoginUseCase loginUseCase;


  bool isVisible = true;
  void changeEye() {
    isVisible = !isVisible;
    emit(ChangeEyeState());
  }


  void login({
    required LoginDataModel loginDataModel
  }) async {
    emit(LoginLoadingState());
    var result =await loginUseCase.call(loginDataModel);
    result.fold((failure){
      print(failure.message);
      emit(LoginErrorState(failure.toString()));
    },(right){
      LoginSuccessState.set(loginEntity: right);
      emit(LoginSuccessState());
    });
  }



  void loginWithGoogle() async {
    emit(LoginLoadingState());
    var result= await AuthService.signInWithGoogle();
    if(result != null){
      // LoginSuccessState.set(loginEntity: right);
      print('result---------------------');
      User user=result.user;
      print(user.email);
      if (result.additionalUserInfo!.isNewUser) {
        print('New user signed in with Google');
      } else {
        print('Existing user signed in with Google');
      }
      emit(LoginSuccessState());
    }else{
      emit(LoginErrorState('login with google failed'));
    }

  }


}
