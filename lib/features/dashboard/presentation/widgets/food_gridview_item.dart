import 'package:ez_eat/core/style/textStyles.dart';
import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/food_details.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key, required this.food, required this.index});
  final FoodEntity food;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetails(
                food: food,
              ),
            ));
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white.withOpacity(.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${food.title}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle18,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        '${food.subTitle}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle14,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '1500',
                            style: Styles.textStyle16.copyWith(
                                decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${food.price} \$',
                            style: Styles.textStyle20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 160,
                child: Image.network(
                  '${food.imageUrl}',
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
