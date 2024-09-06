import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_eat/features/login/domain/entities/login_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/functions/hive_function.dart';
import '../../../../core/functions/user_data/user_data.dart';
import '../../../../core/utils/google_auth.dart';
import '../../../payment/data/models/stripe_model/customer_model.dart';
import '../../../register/data/models/register_model.dart';
import '../models/login_model.dart';

abstract class LoginRemoteDataSource{
 Future<LoginEntity>  login({required LoginDataModel loginDataModel});
 Future<LoginEntity>  googleLogin();
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource{


  @override
  Future<LoginEntity> login({required LoginDataModel loginDataModel}) async{
    LoginEntity? loginEntity;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: loginDataModel.email!, password:loginDataModel.password!)
        .then((value) async {

      loginEntity = await getUserDataFunction(uid: value.user?.uid);

      return loginEntity;
    });
    return loginEntity!;
  }

  @override
  Future<LoginEntity> googleLogin() async{
    LoginEntity? loginEntity;
   await AuthService.signInWithGoogle().then((onValue)async{
     User user=onValue.user;
     await newAccount(onValue, user);
     loginEntity = await getUserDataFunction(uid:onValue.user.uid);
     return loginEntity!;
   });

    return loginEntity!;
  }




  Future<void> newAccount(onValue, User user) async {
    if (onValue.additionalUserInfo!.isNewUser) {
      RegisterModel registerModel=RegisterModel(phone: user.phoneNumber,name: user.displayName,email: user.email);
      CustomerModel customerModel =await createCustomer(
        registerModel: registerModel,
      );
      await createUserData(
        registerModel: registerModel,
        uid: onValue.user.uid, customerId: customerModel.id!,
      );
    }
  }

}