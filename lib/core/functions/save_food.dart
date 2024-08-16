import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:hive/hive.dart';


void saveFoodHive(List<FoodEntity> food, String boxName) {
  var box = Hive.box<FoodEntity>(boxName);
  box.delete;
  box.addAll(food);
}

void saveToHive(String key, value,String boxName) {
  var box = Hive.box(boxName);
  box.put(key,value);
}

