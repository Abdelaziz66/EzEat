import 'package:ez_eat/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  String? email;
  String? uid;
  String? name;
  String? phone;

  LoginModel({this.email, this.uid, this.name, this.phone}) : super(email: email,uid:uid ,name:name ,phone: phone);


  factory LoginModel.fromJson(Map<String?, dynamic>?json)=> LoginModel(
    email : json?['email'],
    uid: json?['uid'],
    name : json?['name'],
    phone : json?['phone'],
  );

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uid': uid,
      'name': name,
      'phone': phone,
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
