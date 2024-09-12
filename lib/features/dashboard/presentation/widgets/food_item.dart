import 'package:ez_eat/core/style/textStyles.dart';
import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/image_error.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key, required this.food, required this.index, required this.onClicked});
  final FoodEntity food;
  final int index;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Stack(
        children: [
          _FoodInfoShape(food: food),
          _CustomImage(food: food),
        ],
      ),
    );
  }
}




class _FoodInfoShape extends StatelessWidget {
  const _FoodInfoShape({
    super.key,
    required this.food,
  });

  final FoodEntity food;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            padding: const EdgeInsets.only(top: 50.0),
            child: _FoodInfo(food: food),
          ),
        ),
      ],
    );
  }
}

class _FoodInfo extends StatelessWidget {
  const _FoodInfo({
    required this.food,
  });

  final FoodEntity food;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '${food.subTitle}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle14,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '1500',
                style: Styles.textStyle16
                    .copyWith(decoration: TextDecoration.lineThrough),
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
    );
  }
}

class _CustomImage extends StatelessWidget {
  const _CustomImage({
    super.key,
    required this.food,
  });

  final FoodEntity food;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 160,
          child: Image.network(
            '${food.imageUrl}',
            errorBuilder: (context, error, stackTrace) => const ImageError(),
          ),
        )
      ],
    );
  }
}
