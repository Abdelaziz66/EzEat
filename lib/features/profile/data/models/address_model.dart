import 'package:ez_eat/features/profile/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  String? name;
  String? phone;
  String? address;

  AddressModel({this.name, this.phone, this.address}) : super(name: name,phone:phone ,address:address );


  factory AddressModel.fromJson(Map<String?, dynamic>?json)=> AddressModel(
    name : json?['name'],
    phone: json?['phone'],
    address : json?['address'],
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
    };
  }

}


