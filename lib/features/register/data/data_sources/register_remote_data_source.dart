import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_eat/core/utils/stripe_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/functions/user_data/user_data.dart';
import '../../../payment/data/models/stripe_model/customer_model.dart';
import '../models/register_model.dart';

abstract class RegisterRemoteDataSource {
  Future<void> register({required RegisterModel registerModel});
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

}
