


import '../../../../dashboard/domain/entities/food_entity.dart';

abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}




class AddToFavouriteSuccessState extends FavouriteState {}

class AddToFavouriteErrorState extends FavouriteState {
  final String errMessage;

  AddToFavouriteErrorState(this.errMessage);
}

class RemoveFromFavouriteSuccessState extends FavouriteState {

}


class RemoveFromFavouriteErrorState extends FavouriteState {
  final String errMessage;

  RemoveFromFavouriteErrorState(this.errMessage);
}


class ChangeFavouriteSuccessState extends FavouriteState {
  static List<FoodEntity> favourite=[];

  static add({required FoodEntity food}){
    favourite.add(food);
  }
  static remove({required FoodEntity food}){
    favourite.remove(food);
  }
}

class GetFavouriteSuccessState extends FavouriteState {

}
