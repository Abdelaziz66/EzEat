import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/hive_function.dart';
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
      food = _getFoodList(value);

      if(uId != null){
        favourite = await _getFavourite();
        food =  _setFavourite(favourite, food);
        cart = await _getCart();
        food =  _setCart(cart, food);
      }
      saveFoodHive(food, kFoodBox);
      return food;
    });

    return food;
  }




  List<FoodEntity> _setCart(List<String> cart, List<FoodEntity> food) {
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

  List<FoodEntity> _setFavourite(List<String> favourite, List<FoodEntity> food) {
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

  Future<List<String>> _getFavourite() async {
    List<String> favourite = [];

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('favourite')
        .get()
        .then((value) async {
      favourite = _getFavouriteList(value);
      return favourite;
    });

    return favourite;
  }

  Future<List<String>> _getCart() async {
    List<String> cart = [];

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('cart')
        .get()
        .then((value) async {
      cart = _getCartList(value);
      return cart;
    });

    return cart;
  }

  List<FoodEntity> _getFoodList(QuerySnapshot<Map<String, dynamic>> value) {
    List<FoodEntity> food = [];
    for (var foodMap in value.docs) {
      food.add(FoodModel.fromJson(foodMap.data()));
    }
    return food;
  }

  List<String> _getFavouriteList(QuerySnapshot<Map<String, dynamic>> value) {
    List<String> favourite = [];
    for (var favouriteMap in value.docs) {
      favourite.add(favouriteMap.id);
    }
    return favourite;
  }

  List<String> _getCartList(QuerySnapshot<Map<String, dynamic>> value) {
    List<String> cart = [];
    for (var cartMap in value.docs) {
      cart.add(cartMap.id);
    }
    return cart;
  }


}
