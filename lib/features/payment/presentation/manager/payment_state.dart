part of 'payment_cubit.dart';

abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoadingState extends PaymentState {}
class PaymentSuccessState extends PaymentState {}
class PaymentErrorState extends PaymentState {
  final String errMessage;

  PaymentErrorState({required this.errMessage});
}
