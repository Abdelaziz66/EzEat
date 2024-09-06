import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_eat/features/login/domain/entities/login_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/functions/hive_function.dart';
import '../models/login_model.dart';

abstract class LoginRemoteDataSource{
 Future<LoginEntity>  login({required LoginDataModel loginDataModel});
 Future<LoginEntity> getUserDataFunction({required uid});
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



}