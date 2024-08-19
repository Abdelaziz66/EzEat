import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/dashboard_cubit/dashboard_cubit.dart';
import 'best_seller_slider.dart';
import 'banner_slider.dart';

class Discount extends StatelessWidget {
  const Discount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is GetDashBoardDataSuccessState ||
            DashboardCubit.get(context).foods.isNotEmpty) {
          return const SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                BannerSlider(),
                BestSellerSlider(),
              ],
            ),
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
