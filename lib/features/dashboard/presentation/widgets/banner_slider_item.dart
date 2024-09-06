import 'package:ez_eat/core/style/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/image_error.dart';
import '../../domain/entities/food_entity.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({
    super.key,
    required this.food,
  });
  final FoodEntity food;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kFoodDetails, extra: food);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width < 600
              ? MediaQuery.of(context).size.width
              : 600,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width < 600
                          ? MediaQuery.of(context).size.width * .75
                          : 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(.3),
                      ),
                      child: _FoodInfo(food: food),
                    ),
                  ),
                ],
              ),
              _CustomImage(food: food),
            ],
          ),
        ),
      ),
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
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            food.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Text(
              food.subTitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle14,
            ),
          ),
          const SizedBox(
            height: 4,
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
    required this.food,
  });

  final FoodEntity food;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.network(
              food.imageUrl!,
              errorBuilder: (context, error, stackTrace) => const ImageError(),
              height: MediaQuery.of(context).size.height * .18,

              // width: 190,
            ),
          ),
        ),
      ],
    );
  }
}
