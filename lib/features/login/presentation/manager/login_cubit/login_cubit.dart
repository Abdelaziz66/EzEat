import 'package:flutter_bloc/flutter_bloc.dart';

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


}
