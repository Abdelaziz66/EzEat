import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:ez_eat/features/login/domain/entities/login_entity.dart';
import 'package:hive/hive.dart';

import '../../features/profile/domain/entities/address_entity.dart';


void saveFoodHive(List<FoodEntity> food, String boxName) {
  var box = Hive.box<FoodEntity>(boxName);
  box.clear();
  box.addAll(food);
}

void saveAddressHive(List<AddressEntity> addressEntity, String boxName) {
  var box = Hive.box<AddressEntity>(boxName);
  box.clear();
  box.addAll(addressEntity);
}

void saveUserLoginHive(LoginEntity loginEntity, String boxName) {
  var box = Hive.box<LoginEntity>(boxName);
  box.put('loginEntity',loginEntity);
}


void save(String key, value,String boxName) {
  var box = Hive.box(boxName);
  box.put(key,value);
}



void clear(String boxName) {
  var box = Hive.box(boxName);
  box.clear();
}


