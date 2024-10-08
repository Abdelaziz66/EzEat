import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/login/data/models/login_model.dart';
import '../../../features/login/domain/entities/login_entity.dart';
import '../../../features/payment/data/models/stripe_model/customer_model.dart';
import '../../../features/register/data/models/register_model.dart';
import '../../constants/constant.dart';
import '../../../features/payment/data/data_sources/stripe_service.dart';
import '../hive_function.dart';


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


Future<CustomerModel> createCustomer({required RegisterModel registerModel}) async {
  StripeService stripeService = StripeService();
  return  await stripeService.createPaymentCustomer(data: registerModel);
}

Future<LoginEntity> getUserDataFunction({required uid}) async{
  LoginEntity? loginEntity;
  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .get()
      .then((value) {
    loginEntity = LoginModel.fromJson(value.data());
    saveUserLoginHive(loginEntity!,kUserBox);
    return  loginEntity;
  });
  return  loginEntity!;
}

Future<void> newAccount(onValue, User user) async {
  if (onValue.additionalUserInfo!.isNewUser) {
    RegisterModel registerModel = RegisterModel(
        phone: user.phoneNumber, name: user.displayName, email: user.email);
    CustomerModel customerModel = await createCustomer(
      registerModel: registerModel,
    );
    await createUserData(
      registerModel: registerModel,
      uid: onValue.user.uid,
      customerId: customerModel.id!,
    );
  }
}