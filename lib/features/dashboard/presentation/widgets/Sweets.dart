
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/show_flutter_toast_message.dart';
import '../manager/dashboard_cubit/dashboard_cubit.dart';
import 'food_gridview.dart';
class Sweets extends StatelessWidget {
  const Sweets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        // if (state is GetDashBoardDataSuccessState) {
        //   foods.addAll(state.food);
        //   print(foods.length);
        // }
        //
        // if (state is GetDashBoardDataErrorState) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     buildErrorWidget(state.errMessage),
        //   );
        // }
      },
      builder: (context, state) {
        DashboardCubit  cubit=DashboardCubit.get(context);
        if (state is GetDashBoardDataSuccessState ||  cubit.foods.isNotEmpty) {
          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              FoodGridView(
                foods: cubit.foods,length: 6,
              ),
            ],
          );
        }
        else if (state is GetDashBoardDataErrorState) {
          return Text(state.errMessage);
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
