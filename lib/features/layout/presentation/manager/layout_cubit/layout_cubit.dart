import 'package:ez_eat/features/cart/presentation/pages/cart.dart';
import 'package:ez_eat/features/dashboard/presentation/pages/dashboard.dart';
import 'package:ez_eat/features/favourite/presentation/pages/favourite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../profile/presentation/pages/profile.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentNavigationBarIndex = 0;
  List<Widget> navigationBarScreens = [
    const Dashboard(),
    const Favourite(),
    const Cart(),
    const Profile(),
  ];
  void onTapNavigationBar(index) {
    currentNavigationBarIndex = index;
    emit(NavigationBarState());
  }
}
