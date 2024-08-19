import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_eat/core/functions/save_food.dart';
import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';

import '../../../../core/constants/constant.dart';
import '../models/food_model.dart';

abstract class FoodRemoteDataSource {
  Future<List<FoodEntity>> getFood();
}

class FoodRemoteDataSourceImpl extends FoodRemoteDataSource {
  @override
  Future<List<FoodEntity>> getFood() async {
    List<FoodEntity> food = [];
    List<String> favourite = [];
    List<String> cart = [];
    await FirebaseFirestore.instance
        .collection('Foods')
        .orderBy('category')
        .get()
        .then((value) async {
      food = getFoodList(value);

      if(uId != null){
        favourite = await getFavourite();
        food =  setFavourite(favourite, food);
        cart = await getCart();
        food =  setCart(cart, food);
      }


      saveFoodHive(food, kFoodBox);

      // value.docs.forEach((element) {
      //   foodId.add(element.id);
      // });
      // print('start update');
      // print(foodId.length);
      // for(int i =0;i<foodId.length;i++){
      //   await FirebaseFirestore.instance
      //       .collection('Foods')
      //       .doc(foodId[i]).update({'category':i+1}).then((value) {
      //         print(i);
      //   });
      //
      // }

      return food;
    });

    return food;
  }

  List<FoodEntity> setCart(List<String> cart, List<FoodEntity> food) {
    for (int i = 0; i < cart.length; i++) {
      for (int ii = 0; ii < food.length; ii++) {
        if (cart[i] == food[ii].id) {
          food[ii].cart = true;
          break;
        }
      }
    }
    return food;
  }

  List<FoodEntity> setFavourite(List<String> favourite, List<FoodEntity> food) {
    for (int i = 0; i < favourite.length; i++) {
      for (int ii = 0; ii < food.length; ii++) {
        if (favourite[i] == food[ii].id) {
          food[ii].favourite = true;
          break;
        }
      }
    }
    return food;
  }


  Future<List<String>> getFavourite() async {
    List<String> favourite = [];

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('favourite')
        .get()
        .then((value) async {
      favourite = getFavouriteList(value);
      // saveToHive('favourite', favourite, kFavouriteBox);
      return favourite;
    });

    return favourite;
  }

  Future<List<String>> getCart() async {
    List<String> cart = [];

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('cart')
        .get()
        .then((value) async {
      cart = getCartList(value);
      // saveToHive('favourite', favourite, kFavouriteBox);
      return cart;
    });

    return cart;
  }

  List<FoodEntity> getFoodList(QuerySnapshot<Map<String, dynamic>> value) {
    List<FoodEntity> food = [];
    for (var foodMap in value.docs) {
      food.add(FoodModel.fromJson(foodMap.data()));
    }
    return food;
  }

  List<String> getFavouriteList(QuerySnapshot<Map<String, dynamic>> value) {
    List<String> favourite = [];
    for (var favouriteMap in value.docs) {
      favourite.add(favouriteMap.id);
    }
    return favourite;
  }

  List<String> getCartList(QuerySnapshot<Map<String, dynamic>> value) {
    List<String> cart = [];
    for (var cartMap in value.docs) {
      cart.add(cartMap.id);
    }
    return cart;
  }
// Future<void> updateFood() async {
//   for(int i=0;i<=26;i++){
//     await FirebaseFirestore.instance
//         .collection('Foods')
//         .doc(foodsId[i])
//         .update({
//       'imageUrl': imagesURL[i],
//     },)
//         .then((value) {})
//         .catchError((error) {});
//   }
//
// }
//
// Future<void> uploadFoodData() async {
//   List<Map<String, dynamic>> details = [
//     {
//       'id': 1,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Twister Combo',
//       'subTitle':
//           '2 crispy chicken strips ,tomatoes, lettuce & pepper mayo in a toasted tortilla wrap',
//       'price': 8
//     },
//     {
//       'id': 2,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Dinner Plus',
//       'subTitle': '3 COB + 1 Fries + 1 Coleslaw + 1 Rizo',
//       'price': 5
//     },
//     {
//       'id': 3,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Chicken Zinger Combo',
//       'subTitle': 'Chicken Zinger Combo',
//       'price': 4
//     },
//     {
//       'id': 4,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Mozzarella Burger Box',
//       'subTitle':
//           '1 Mozzarella Mozzarella Burger Sandwich + 1 pc Chicken + 1 Rice+ Coleslaw+ Drink Can',
//       'price': 8
//     },
//     {
//       'id': 5,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Chicken Piece - Spicy',
//       'subTitle': 'Chicken Piece - Spicy',
//       'price': 3
//     },
//     {
//       'id': 6,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': '5 Pcs Shrimp',
//       'subTitle': '5 Pcs Shrimp',
//       'price': 4
//     },
//     {
//       'id': 7,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'French Fries',
//       'subTitle': ' Golden Fries',
//       'price': 2
//     },
//     {
//       'id': 8,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Plain Rice',
//       'subTitle': 'Plain Rice',
//       'price': 3
//     },
//     {
//       'id': 9,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Coleslaw',
//       'subTitle': 'Coleslaw',
//       'price': 2
//     },
//     {
//       'id': 10,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Sauces',
//       'subTitle': 'Sauces',
//       'price': 1
//     },
//     {
//       'id': 11,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Shrimp Rizo',
//       'subTitle': 'special rice with shrimp pieces and sauce',
//       'price': 6
//     },
//     {
//       'id': 12,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Jalapeño Fries',
//       'subTitle': 'Jalapeño Fries',
//       'price': 4
//     },
//     {
//       'id': 13,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Cookie',
//       'subTitle': 'Cookie',
//       'price': 3
//     },
//     {
//       'id': 14,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Pepsi',
//       'subTitle': 'Pepsi',
//       'price': 2
//     },
//     {
//       'id': 15,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Diet Pepsi',
//       'subTitle': 'Diet Pepsi',
//       'price': 2
//     },
//     {
//       'id': 16,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Mirinda',
//       'subTitle': 'Mirinda',
//       'price': 2
//     },
//     {
//       'id':17,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': '7 UP',
//       'subTitle': '7 UP',
//       'price': 2
//     },
//     {
//       'id': 18,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Water',
//       'subTitle': 'Water',
//       'price': 1
//     },
//     {
//       'id': 19,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Mozzarella Burger Combo',
//       'subTitle': '1 Mozzarella Burger Sandwich + 1 Fries + 1 Pepsi',
//       'price': 11
//     },
//     {
//       'id': 20,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Mozzarella Burger Plus',
//       'subTitle':
//           '1 Mozzarella Mozzarella Burger Sandwich + Rizo + Coleslaw+ Drink',
//       'price': 10
//     },
//     {
//       'id':21,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Mozzarella Burger Box',
//       'subTitle':
//           '1 Mozzarella Mozzarella Burger Sandwich + 1 pc Chicken + 1 Rice+ Coleslaw+ Drink Can',
//       'price': 12
//     },
//     {
//       'id': 22,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Mozzarella Burger Sandwich - Spicy',
//       'subTitle': 'Mozzarella Burger Sandwich - Spicy',
//       'price': 8
//     },
//     {
//       'id':23,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Mighty Plus',
//       'subTitle': 'Mighty Zinger Sandwich + Rizo + Coleslaw+ Drink',
//       'price': 8
//     },
//     {
//       'id': 24,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'Dinner Plus',
//       'subTitle': '3 COB + 1 Fries + 1 Coleslaw + 1 Rizo',
//       'price': 6
//     },
//     {
//       'id': 25,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': '8 Pc Festive Bucket',
//       'subTitle':
//           '8 pc chicken + 1 large coleslaw + family fries + 3 bun + 1 L Drink',
//       'price': 9
//     },
//     {
//       'id':26,
//       'carb': '30',
//       'fat': '50',
//       'protein': '70',
//       'title': 'My Bucket',
//       'subTitle': 'W1 Pc Chicken + 2 Strips + 1 Fries + 1 Pepsi',
//       'price': 7
//     },
//   ];
//   details.forEach((element) async {
//     await FirebaseFirestore.instance
//         .collection('Foods')
//         .add(element)
//         .then((value) {})
//         .catchError((error) {
//       print(error.toString());
//     });
//   });
// }
//
// Future<void> uploadImages() async {
//   String? imageURL = '';
//   var picker = ImagePicker();
//   File? image;
//   FirebaseStorage storage = FirebaseStorage.instance;
//   print('-----------------------------------');
//   imagesURL = [];
//   final pickedFile = await picker.pickMultiImage();
//   for (int i = 0; i < pickedFile.length; i++) {
//     // final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile.isNotEmpty) {
//       image = File(pickedFile[i].path);
//     }
//
//     await storage
//         .ref()
//         .child('FoodImage/${Uri.file(image!.path).pathSegments.last}')
//         .putFile(image)
//         .then((value) async {
//       await value.ref.getDownloadURL().then((value) {
//         imageURL = value;
//         imagesURL.add(imageURL);
//       }).catchError((error) {
//         print(error.toString());
//       });
//     }).catchError((error) {
//       print(error.toString());
//     });
//   }
// }

}
