import 'package:dio/dio.dart';
import 'package:ez_eat/core/utils/api_service.dart';
import 'package:ez_eat/features/payment/data/models/stripe_model/payment_intent_input_model.dart';
import 'package:ez_eat/features/payment/data/models/stripe_model/payment_intent_model.dart';
import 'package:flutter/material.dart';
import '../../features/payment/data/models/stripe_model/customer_model.dart';
import '../../features/payment/data/models/stripe_model/ephemeral_key_model.dart';
import '../../features/payment/data/models/stripe_model/init_payment_sheet_input_model.dart';
import '../../features/register/data/models/register_model.dart';
import 'api_keys.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<CustomerModel> createPaymentCustomer(
      {required RegisterModel data}) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      endPoint: 'v1/customers',
      token: ApiKeys.secretKey,
      data: {'name': data.name, 'phone': data.phone, 'email': data.email},
    );

    CustomerModel customerModel = CustomerModel.fromJson(response.data);
    return customerModel;
  }

  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel data}) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      endPoint: 'v1/payment_intents',
      token: ApiKeys.secretKey,
      data: data.toJson(),
    );

    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        data: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Stripe-Version': '2024-06-20'
        },
        endPoint: 'v1/ephemeral_keys');

    EphemeralKeyModel ephemeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKey;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'Taste Trek',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    PaymentIntentModel paymentIntentModel =
        await createPaymentIntent(data: paymentIntentInputModel);
    EphemeralKeyModel ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    InitPaymentSheetInputModel initPaymentSheetInputModel =
        InitPaymentSheetInputModel(
            clientSecret: paymentIntentModel.clientSecret!,
            customerId: paymentIntentInputModel.customerId,
            ephemeralKeySecret: ephemeralKeyModel.secret!);
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }
}
