import 'package:hive/hive.dart';
part'login_entity.g.dart';

@HiveType(typeId: 0)
class LoginEntity{
 @HiveField(0)
 final String? email;
 @HiveField(1)
 final String? uid;
 @HiveField(2)
 final String? name;
 @HiveField(3)
 final String? phone;

  LoginEntity( {required this.email,required this.uid, required this.name,required this.phone});

}