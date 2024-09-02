import 'package:dartz/dartz.dart';
import 'package:ez_eat/core/errors/failure.dart';
import 'package:ez_eat/core/use_cases/use_case.dart';
import 'package:ez_eat/features/payment/data/models/stripe_model/payment_intent_input_model.dart';
import 'package:ez_eat/features/payment/domain/repositories/payment_repo.dart';

class PaypalPaymentUseCase extends UseCase<void,PaymentIntentInputModel>{
  final PaymentRepo paymentRepo;

  PaypalPaymentUseCase({required this.paymentRepo});
  @override
  Future<Either<Failure, void>> call([PaymentIntentInputModel? paymentIntentInputModel]) async{
   return await paymentRepo.createPayment(paymentIntentInputModel: paymentIntentInputModel!);
  }

}