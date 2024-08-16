
import 'package:ez_eat/features/dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:ez_eat/features/favourite/domain/use_cases/add_to_favourite_usecase.dart';
import 'package:ez_eat/features/favourite/domain/use_cases/remove_from_favourite_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/functions/save_food.dart';
import '../../../../dashboard/domain/entities/food_entity.dart';
import 'favourite_state.dart';



class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit({required this.addToFavouriteUseCase,required this.removeFromFavouriteUseCase}) : super(FavouriteInitial());
  static FavouriteCubit get(context) => BlocProvider.of(context);

 final AddToFavouriteUseCase addToFavouriteUseCase;
  final RemoveFromFavouriteUseCase removeFromFavouriteUseCase;




  void addToFavourite({required FoodEntity food,required context})async{
    for(int i=0;i< DashboardCubit.get(context).foods.length;i++){
      if( DashboardCubit.get(context).foods[i].id==food.id){
        if(DashboardCubit.get(context).foods[i].favourite){
          break;
        }
        DashboardCubit.get(context).foods[i].favourite=true;
        ChangeFavouriteSuccessState.add(food:food);
        // saveFoodHive( DashboardCubit.get(context).foods, kFoodBox);
        emit(ChangeFavouriteSuccessState());
        break;
      }
    }

    var result = await addToFavouriteUseCase.call(food.id);

    result.fold((failure) {
      emit(AddToFavouriteErrorState(failure.message));
      print(failure.message);
    }, (r) {
      emit(AddToFavouriteSuccessState());
    });

  }

  void removeFromFavourite({required FoodEntity food,required context})async{
    for(int i=0;i< DashboardCubit.get(context).foods.length;i++){
      if( DashboardCubit.get(context).foods[i].id==food.id){
        if(!DashboardCubit.get(context).foods[i].favourite){
          break;
        }
        DashboardCubit.get(context).foods[i].favourite=false;
        ChangeFavouriteSuccessState.remove(food:food);
        // saveFoodHive( DashboardCubit.get(context).foods, kFoodBox);
        emit(ChangeFavouriteSuccessState());
        break;
      }
    }
    // print('---------------');
    // print('this is now must be unfavourite');
    // print('---------------');
    // print(food.title);
    // print(food.favourite);
    // print('---------------');
    // print('this is now must be favourite');
    // print('---------------');
    // ChangeFavouriteSuccessState.favourite.forEach((element) {
    //   print(element.title);
    //   print(element.favourite);
    //   print('---------------');
    // });
    var result = await removeFromFavouriteUseCase.call(food.id);
    result.fold((failure) {
      emit(RemoveFromFavouriteErrorState(failure.message));
      print(failure.message);
    }, (r) {
      emit(RemoveFromFavouriteSuccessState());
    });

  }



}
