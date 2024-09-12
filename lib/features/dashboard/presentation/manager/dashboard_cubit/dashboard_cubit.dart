import 'package:ez_eat/features/dashboard/domain/use_cases/food_use_case.dart';
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

  final FoodUseCase foodUseCase;

  List<Widget> bestSellerCarouselList = [];
  List<Widget> offersCarouselList = [];

  List<FoodEntity> foods = [];

  Future<void> getFood() async {
    emit(GetDashBoardDataLoadingState());
    var result = await foodUseCase.call();
    result.fold((failure) {
      emit(GetDashBoardDataErrorState(failure.message));
    }, (food) {
      emit(GetDashBoardDataSuccessState(food));
    });
  }

  void mainGetFood() {
    if (isMainGetFood) {
      getFood();
    }
  }

  void getFavourite({required List<FoodEntity> foods}) {
    for (int i = 0; i < foods.length; i++) {
      if (foods[i].favourite) {
        ChangeFavouriteSuccessState.add(food: foods[i]);
      }
    }
  }

  void getCart({required List<FoodEntity> foods}) {
    for (int i = 0; i < foods.length; i++) {
      if (foods[i].cart) {
        ChangeCartSuccessState.add(food: foods[i]);
      }
    }
  }
}
