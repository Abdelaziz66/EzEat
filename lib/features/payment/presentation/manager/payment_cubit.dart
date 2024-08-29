import 'package:bloc/bloc.dart';
import 'package:ez_eat/features/payment/data/models/payment_intent_input_model.dart';
import 'package:ez_eat/features/payment/domain/use_cases/payment_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.paymentUseCase}) : super(PaymentInitial());
  static PaymentCubit get(context) => BlocProvider.of(context);

  final PaymentUseCase paymentUseCase;

  Future<void> createPayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoadingState());
    var response = await paymentUseCase.call(paymentIntentInputModel);
    response.fold((l){
      emit(PaymentErrorState(errMessage: l.message));
      print(l.message);
    }, (r){
      emit(PaymentSuccessState());
    });
  }
}
