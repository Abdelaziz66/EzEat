import 'package:ez_eat/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {

  LoginModel( {super.email, super.uid, super.name, super.phone, super.id,});


  factory LoginModel.fromJson(Map<String?, dynamic>?json)=> LoginModel(
    email : json?['email'],
    uid: json?['uid'],
    name : json?['name'],
    phone : json?['phone'],
    id:  json?['id'],
  );

  Map<String, dynamic> toMap() {
    return {
      'email': super.email,
      'uid': super.uid,
      'name': super.name,
      'phone': super.phone,
      'id': super.id,
    };
  }

}

class LoginDataModel {
  String? email;
  String? password;

  LoginDataModel({
    this.email,
    this.password,
  });
}
