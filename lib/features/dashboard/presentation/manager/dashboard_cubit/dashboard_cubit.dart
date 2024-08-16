import 'package:ez_eat/features/dashboard/domain/use_cases/food_usecase.dart';
import 'package:ez_eat/features/dashboard/presentation/widgets/Discount.dart';
import 'package:ez_eat/features/dashboard/presentation/widgets/Sweets.dart';
import 'package:ez_eat/features/dashboard/presentation/widgets/drinks.dart';
import 'package:ez_eat/features/dashboard/presentation/widgets/sandwiches.dart';
import 'package:ez_eat/features/favourite/presentation/manager/favourite_cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  List<Widget> bestSellerCarusolList =[];
  List<Widget> offersCarusolList =[];

  List<FoodEntity> foods = [];
  Future<void> getFood() async {
    emit(GetDashBoardDataLoadingState());
    var result = await foodUseCase.call();
    result.fold((failure) {
      emit(GetDashBoardDataErrorState(failure.message));
      print(failure.message);
    }, (food) {
      emit(GetDashBoardDataSuccessState(food));
    });
  }
  void getFavourite({required List<FoodEntity> foods}){
    for(int i=0;i< foods.length;i++) {
      if(foods[i].favourite) {
        ChangeFavouriteSuccessState.add(food:foods[i]);
      }
    }

  }
}
