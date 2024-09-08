import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';

class FoodModel extends FoodEntity {



  FoodModel(
      {super.id,
      super.title,
      super.subTitle,
      super.price,
      super.protein,
      super.carb,
      super.fat,
      super.imageUrl});

  factory FoodModel.fromJson(Map<String?, dynamic>? json) => FoodModel(
        id: json?['id'],
        title: json?['title'],
        subTitle: json?['subTitle'],
        price: json?['price'],
        protein: json?['protein'],
        carb: json?['carb'],
        fat: json?['fat'],
        imageUrl: json?['imageUrl'],
      );
  Map<String, dynamic> toMap() {
    return {
      'id': super.id,
      'title': super.title,
      'subTitle': super.subTitle,
      'price': super.price,
      'protein': super.protein,
      'carb': super.carb,
      'fat': super.fat,
      'imageUrl': super.imageUrl,
    };
  }
}
