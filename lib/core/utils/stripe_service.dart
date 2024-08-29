import 'package:ez_eat/core/utils/api_service.dart';
import 'package:ez_eat/features/payment/data/models/payment_intent_input_model.dart';
import 'package:ez_eat/features/payment/data/models/payment_intent_model.dart';
import 'api_keys.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {

  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel data}) async {
    var response = await apiService.post(
        endPoint: 'payment_intents',
        token: ApiKeys.secretKey,
        data: data.toJson());
    PaymentIntentModel paymentIntentModel=PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret})async{
    Stripe.instance.initPaymentSheet(paymentSheetParameters:SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      merchantDisplayName: 'Taste Trek'
    ));


  }

}
