import 'package:dartz/dartz.dart';
import 'package:ez_eat/features/payment/data/models/payment_intent_input_model.dart';

import '../../../../core/errors/failure.dart';

abstract class PaymentRepo{
  Future<Either<Failure,void>> createPayment({required PaymentIntentInputModel paymentIntentInputModel});
}