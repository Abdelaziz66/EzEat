


import '../../../../dashboard/domain/entities/food_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class AddToCartSuccessState extends CartState {}
class AddToCartErrorState extends CartState {
  final String errMessage;
  AddToCartErrorState(this.errMessage);
}

class RemoveFromCartSuccessState extends CartState {}
class RemoveFromCartErrorState extends CartState {
  final String errMessage;

  RemoveFromCartErrorState(this.errMessage);
}


class ChangeCartSuccessState extends CartState {
  static List<FoodEntity> cart=[];

  static add({required FoodEntity food}){
    cart.add(food);
  }
  static remove({required FoodEntity food}){
    cart.remove(food);
  }
}
class GetCartSuccessState extends CartState {}
