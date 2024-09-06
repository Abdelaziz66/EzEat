import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/dashboard_cubit/dashboard_cubit.dart';
import 'food_gridview.dart';

class Drinks extends StatelessWidget {
  const Drinks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        DashboardCubit cubit = DashboardCubit.get(context);
        if (state is GetDashBoardDataSuccessState || cubit.foods.isNotEmpty) {
          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              FoodGridView(
                foods: cubit.foods,
                length: 5,
              ),
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
