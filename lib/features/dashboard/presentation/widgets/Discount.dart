

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/show_flutter_toast_message.dart';
import '../manager/dashboard_cubit/dashboard_cubit.dart';
import 'best_seller_listview.dart';
import 'offers_slider_item.dart';
import 'offers_slider.dart';

class Discount extends StatelessWidget {
  const Discount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        if (state is GetDashBoardDataSuccessState) {
          // foods.addAll(state.foods);
        }

        if (state is GetDashBoardDataErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            showFlutterToastMessage( message: state.errMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is GetDashBoardDataSuccessState || DashboardCubit.get(context).foods.isNotEmpty) {
          return const Column(
            children: [
              SizedBox(height: 15,),
              OffersSlider(),
              BestSellerListView(),




            ],
          );
        } else if (state is GetDashBoardDataErrorState) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}



