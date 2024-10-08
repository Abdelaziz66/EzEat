import 'package:animations/animations.dart';
import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/food_details.dart';
import '../manager/dashboard_cubit/dashboard_cubit.dart';
import 'food_item.dart';

class FoodGridView extends StatelessWidget {
  const FoodGridView({super.key, required this.foods, required this.length});

  final List<FoodEntity> foods;
  final int length;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        DashboardCubit cubit = DashboardCubit.get(context);
        if (state is GetDashBoardDataSuccessState || cubit.foods.isNotEmpty) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                itemCount: length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => OpenContainer(
                  transitionDuration: const Duration(milliseconds: 400),
                  openColor: Colors.transparent,
                  closedColor: Colors.transparent,
                  closedElevation: 0,
                  openElevation: 0,
                  middleColor: Colors.transparent,
                  transitionType: ContainerTransitionType.fade,

                  closedBuilder: (BuildContext context,VoidCallback openContainer)=>FoodItem(
                    food: length == 7
                        ? foods[index + 8]
                        : length == 6
                        ? foods[index + 15]
                        : foods[index + 21],
                    index: length == 7
                        ? index + 8
                        : length == 6
                        ? index + 15
                        : index + 21, onClicked: openContainer,
                  ),
                  openBuilder: (BuildContext context, _) =>FoodDetails(
                    food: length == 7
                        ? foods[index + 8]
                        : length == 6
                        ? foods[index + 15]
                        : foods[index + 21],
                  ),

                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: .7 / 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 265,
                ),
              ),
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
