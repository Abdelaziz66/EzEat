import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';

class FoodModel extends FoodEntity{
  String? id;
  String? title;
  String? subTitle;
  num? price;
  String? protein;
  String? carb;
  String? fat;
  String? imageUrl;

  FoodModel({this.id,
      this.title,
      this.subTitle,
      this.price,
      this.protein,
      this.carb,
      this.fat,
    this.imageUrl
  }):super(id: id, title: title, subTitle: subTitle, price: price, protein: protein, carb: carb, fat: fat,imageUrl:imageUrl);

  factory FoodModel.fromJson(Map<String?, dynamic>?json)=> FoodModel(
      id : json?['id'],
      title: json?['title'],
      subTitle : json?['subTitle'],
      price : json?['price'],
      protein : json?['protein'],
      carb : json?['carb'],
      fat : json?['fat'],
      imageUrl : json?['imageUrl'],
  );
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'price': price,
      'protein': protein,
      'carb': carb,
      'fat': fat,
      'imageUrl':imageUrl,

    };
  }
}
