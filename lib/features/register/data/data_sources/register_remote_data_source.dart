import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_eat/core/utils/stripe_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../payment/data/models/stripe_model/customer_model.dart';
import '../models/register_model.dart';

abstract class RegisterRemoteDataSource {
  Future<void> register({required RegisterModel registerModel});
  Future<void> createUserData(
      {required RegisterModel registerModel, required uid,required String customerId});
  Future<void> createCustomer({
    required RegisterModel registerModel,
  });
}

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource {
  @override
  Future<void> register({required RegisterModel registerModel}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: registerModel.email!, password: registerModel.password!)
        .then((value) async {
      CustomerModel customerModel =await createCustomer(
        registerModel: registerModel,
      );
     await createUserData(
        registerModel: registerModel,
        uid: value.user!.uid, customerId: customerModel.id!,
      ).catchError((onError) {});

    });
  }

  @override
  Future<void> createUserData(
      {required RegisterModel registerModel,
      required uid,
      required String customerId}) async {
    Map<String, dynamic> x = {
      'name': registerModel.name,
      'email': registerModel.email,
      'phone': registerModel.phone,
      'uid': uid,
      'id': customerId
    };

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(x)
        .then((value) {});
  }

  @override
  Future<CustomerModel> createCustomer({required RegisterModel registerModel}) async {
    StripeService stripeService = StripeService();
   return  await stripeService.createPaymentCustomer(data: registerModel);
  }
}
