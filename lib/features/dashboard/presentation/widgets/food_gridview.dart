import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:flutter/material.dart';

import '../manager/dashboard_cubit/dashboard_cubit.dart';
import 'best_seller_item.dart';
import 'food_gridview_item.dart';

class FoodGridView extends StatelessWidget {
  const FoodGridView(
      {super.key, required List<FoodEntity> this.foods, required this.length});
  final List<FoodEntity> foods;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GridView.builder(
          itemCount: length,
          scrollDirection: Axis.vertical,
          // shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => FoodItem(
            food: length == 7
                ? foods[index + 8]
                : length == 6
                    ? foods[index + 15]
                    : foods[index + 21],
            index: length == 7
                ? index + 8
                : length == 6
                    ? index + 15
                    : index + 21,
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: .7 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
            mainAxisExtent: 250,
          ),
        ),
      ),
    );
  }
}
