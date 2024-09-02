import 'package:dartz/dartz.dart';

import 'package:ez_eat/core/errors/failure.dart';
import 'package:ez_eat/core/utils/stripe_service.dart';
import 'package:ez_eat/features/payment/data/models/stripe_model/payment_intent_input_model.dart';

import '../../../../core/functions/papal/paypal_payment.dart';
import '../../domain/repositories/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo{
  final StripeService stripeService=StripeService();
  @override
  Future<Either<Failure, void>> createPayment({required PaymentIntentInputModel paymentIntentInputModel}) async{
    try{
      await stripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel,);
     return right(null);
    }
    catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

}