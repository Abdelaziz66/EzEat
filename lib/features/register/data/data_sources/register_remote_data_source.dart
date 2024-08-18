import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/register_model.dart';

abstract class RegisterRemoteDataSource{
 Future<void>  register({required RegisterModel registerModel});
 Future<void> createUserData({required RegisterModel registerModel,required uid});
}

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource{


  @override
  Future<void> register({required RegisterModel registerModel}) async{
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: registerModel.email!, password: registerModel.password!)
        .then((value) {

      createUserData(
        registerModel:registerModel,
        uid: value.user!.uid,
      ).catchError((onError){

      });

  });
  }

  @override
  Future<void> createUserData({required RegisterModel registerModel,required uid}) async {

    Map<String,dynamic> x = {
      'name':registerModel.name,
      'email':registerModel.email,
      'phone':registerModel.phone,
      'uid':uid,
    };

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(x)
        .then((value) {

    });
  }


}