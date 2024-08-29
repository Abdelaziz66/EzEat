import 'package:dio/dio.dart';
import 'package:ez_eat/core/utils/api_service.dart';
import 'package:ez_eat/features/payment/data/models/payment_intent_input_model.dart';
import 'package:ez_eat/features/payment/data/models/payment_intent_model.dart';
import 'api_keys.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {

  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel data}) async {
    print('____________________________________________________________');
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      endPoint: 'v1/payment_intents',
      token: ApiKeys.secretKey,
      data: data.toJson(),
    );
    print('____________________________________________________________');
    PaymentIntentModel paymentIntentModel=PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret})async{
    await Stripe.instance.initPaymentSheet(paymentSheetParameters:SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      merchantDisplayName: 'Taste Trek'
    ));


  }

  Future displayPaymentSheet()async{
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required PaymentIntentInputModel data})async{
    PaymentIntentModel paymentIntentModel=await createPaymentIntent(data: data);
    await initPaymentSheet(paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();

  }

}
