
import 'package:ez_eat/features/cart/domain/use_cases/add_to_cart_usecase.dart';
import 'package:ez_eat/features/cart/domain/use_cases/remove_from_cart_usecase.dart';
import 'package:ez_eat/features/dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/constant.dart';
import '../../../../../core/functions/hive_function.dart';
import '../../../../dashboard/domain/entities/food_entity.dart';

import 'cart_state.dart';



class CartCubit extends Cubit<CartState> {
  CartCubit({required this.addToCartUseCase,required this.removeFromCartUseCase}) : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);

 final AddToCartUseCase addToCartUseCase;
 final RemoveFromCartUseCase removeFromCartUseCase;
 int activePaymentIndex = 0;





  void addToCart({required FoodEntity food,required context})async{
    for(int i=0;i< DashboardCubit.get(context).foods.length;i++){
      if( DashboardCubit.get(context).foods[i].id==food.id){
        if(DashboardCubit.get(context).foods[i].cart){
          break;
        }
        DashboardCubit.get(context).foods[i].cart=true;
        ChangeCartSuccessState.add(food:food);
        saveFoodHive( DashboardCubit.get(context).foods, kFoodBox);
        emit(ChangeCartSuccessState());
        break;
      }
    }
    await addToCartCloud(food: food);
  }

  void removeFromCart({required FoodEntity food,required context})async{
    for(int i=0;i< DashboardCubit.get(context).foods.length;i++){
      if( DashboardCubit.get(context).foods[i].id==food.id){
        if(!DashboardCubit.get(context).foods[i].cart){
          break;
        }
        DashboardCubit.get(context).foods[i].cart=false;
        ChangeCartSuccessState.remove(food:food);
        saveFoodHive( DashboardCubit.get(context).foods, kFoodBox);
        emit(ChangeCartSuccessState());
        break;
      }
    }
   await removeFromCartCloud(food: food);
  }

 Future<void>addToCartCloud({required FoodEntity food})async{
    if(uId != null){
      var result = await addToCartUseCase.call(food.id);
      result.fold((failure) {
        emit(AddToCartErrorState(failure.message));
      }, (r) {
        emit(AddToCartSuccessState());
      });
    }
  }
  Future<void> removeFromCartCloud({required FoodEntity food})async{
    if(uId != null){
      var result = await removeFromCartUseCase.call(food.id);
      result.fold((failure) {
        emit(RemoveFromCartErrorState(failure.message));
      }, (r) {
        emit(RemoveFromCartSuccessState());
      });
    }


  }
}
