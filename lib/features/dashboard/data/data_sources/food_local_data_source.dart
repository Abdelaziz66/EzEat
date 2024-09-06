import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:hive/hive.dart';
import '../../../../core/constants/constant.dart';

abstract class FoodLocalDataSource {
  List<FoodEntity> getFood();
}

class FoodLocalDataSourceImpl extends FoodLocalDataSource {
  @override
  List<FoodEntity> getFood() {
    var box = Hive.box<FoodEntity>(kFoodBox);
    return box.values.toList();
  }
}
