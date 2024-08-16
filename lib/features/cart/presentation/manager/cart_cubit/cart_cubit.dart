
import 'package:ez_eat/features/dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../dashboard/domain/entities/food_entity.dart';
import '../../../domain/use_cases/add_to_cart_usecase.dart';
import '../../../domain/use_cases/remove_from_cart_usecase.dart';
import 'cart_state.dart';



class CartCubit extends Cubit<CartState> {
  CartCubit({required this.addToCartUseCase,required this.removeFromCartUseCase}) : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);

 final AddToCartUseCase addToCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;




  void addToFavourite({required FoodEntity food,required context})async{
    for(int i=0;i< DashboardCubit.get(context).foods.length;i++){
      if( DashboardCubit.get(context).foods[i].id==food.id){
        if(DashboardCubit.get(context).foods[i].cart){
          break;
        }
        DashboardCubit.get(context).foods[i].cart=true;
        ChangeCartSuccessState.add(food:food);
        // saveFoodHive( DashboardCubit.get(context).foods, kFoodBox);
        emit(ChangeCartSuccessState());
        break;
      }
    }

    var result = await addToCartUseCase.call(food.id);

    result.fold((failure) {
      emit(AddToCartErrorState(failure.message));
      print(failure.message);
    }, (r) {
      emit(AddToCartSuccessState());
    });

  }

  void removeFromFavourite({required FoodEntity food,required context})async{
    for(int i=0;i< DashboardCubit.get(context).foods.length;i++){
      if( DashboardCubit.get(context).foods[i].id==food.id){
        if(!DashboardCubit.get(context).foods[i].cart){
          break;
        }
        DashboardCubit.get(context).foods[i].cart=false;
        ChangeCartSuccessState.remove(food:food);
        // saveFoodHive( DashboardCubit.get(context).foods, kFoodBox);
        emit(ChangeCartSuccessState());
        break;
      }
    }
    var result = await removeFromCartUseCase.call(food.id);
    result.fold((failure) {
      emit(RemoveFromCartErrorState(failure.message));
      print(failure.message);
    }, (r) {
      emit(RemoveFromCartSuccessState());
    });

  }



}
