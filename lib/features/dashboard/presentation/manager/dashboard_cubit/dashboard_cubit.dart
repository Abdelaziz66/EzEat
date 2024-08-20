import 'package:ez_eat/features/dashboard/domain/use_cases/food_use_case.dart';
import 'package:ez_eat/features/dashboard/presentation/widgets/discount.dart';
import 'package:ez_eat/features/dashboard/presentation/widgets/sweets.dart';
import 'package:ez_eat/features/dashboard/presentation/widgets/drinks.dart';
import 'package:ez_eat/features/dashboard/presentation/widgets/sandwiches.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../cart/presentation/manager/cart_cubit/cart_state.dart';
import '../../../../favourite/presentation/manager/favourite_cubit/favourite_state.dart';
import '../../../domain/entities/food_entity.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required this.foodUseCase}) : super(DashboardInitial());
  static DashboardCubit get(context) => BlocProvider.of(context);

  int currentTabBarIndex = 0;
  List<Widget> tabBarScreens = [
    const Discount(),
    const Sandwiches(),
    const Sweets(),
    const Drinks(),
  ];
  void onTapTabBar(index) {
    currentTabBarIndex = index;
    emit(TabBarState());
  }

  final FoodUseCase foodUseCase;

  List<Widget> bestSellerCarouselList =[];
  List<Widget> offersCarouselList =[];

  List<FoodEntity> foods = [];

  Future<void> getFood({required String text}) async {
      print(uId);
      print(isSkip);
      print(text);
      emit(GetDashBoardDataLoadingState());
      var result = await foodUseCase.call();
      result.fold((failure) {
        emit(GetDashBoardDataErrorState(failure.message));
      }, (food) {
        emit(GetDashBoardDataSuccessState(food));
      });
  }

  void mainGetFood(){
    if(isMainGetFood){
      getFood(text: 'From Main');
    }
  }

  void getFavourite({required List<FoodEntity> foods}){
    for(int i=0;i< foods.length;i++) {
      if(foods[i].favourite) {
        ChangeFavouriteSuccessState.add(food:foods[i]);
      }
    }

  }

  void getCart({required List<FoodEntity> foods}){
    for(int i=0;i< foods.length;i++) {
      if(foods[i].cart) {
        ChangeCartSuccessState.add(food:foods[i]);
      }
    }

  }
}
