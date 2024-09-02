import 'package:ez_eat/features/payment/data/models/stripe_model/payment_intent_input_model.dart';
import 'package:ez_eat/features/payment/domain/use_cases/payment_usecase.dart';
import 'package:ez_eat/features/payment/presentation/manager/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/paypal_model/amount_model.dart';
import '../../data/models/paypal_model/item_list_model.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({ required this.paymentUseCase}) : super(PaymentInitial());
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

  // Future<void> payPalPayment({required  context,
  //   required ({AmountModel amount, ItemListModel itemList}) transactionsData}) async {
  //   emit(PaymentLoadingState());
  //   var transactions= [
  //     {
  //       "amount": transactionsData.amount.toJson(),
  //       "description": "The payment transaction description.",
  //       "item_list": transactionsData.itemList.toJson(),
  //     }
  //   ];
  //   var response = await paypalPaymentUseCase.call(transactions);
  //   response.fold((l){
  //     emit(PaymentErrorState(errMessage: l.message));
  //     print(l.message);
  //   }, (r){
  //     emit(PaymentSuccessState());
  //   });
  // }


}
