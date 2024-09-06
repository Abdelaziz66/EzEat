import 'package:hive/hive.dart';
part 'food_entity.g.dart';

@HiveType(typeId: 0)
class FoodEntity {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? subTitle;
  @HiveField(3)
  final num? price;
  @HiveField(4)
  final String? protein;
  @HiveField(5)
  final String? carb;
  @HiveField(6)
  final String? fat;
  @HiveField(7)
  final String? imageUrl;
  @HiveField(8)
  bool favourite = false;
  @HiveField(9)
  bool cart = false;

  FoodEntity({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.protein,
    required this.carb,
    required this.fat,
    required this.imageUrl,
  });
}
