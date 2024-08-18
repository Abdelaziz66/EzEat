import 'package:ez_eat/core/style/textStyles.dart';
import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/widgets/food_details.dart';
import '../../../cart/presentation/manager/cart_cubit/cart_cubit.dart';
import '../../../favourite/presentation/manager/favourite_cubit/favourite_cubit.dart';
import 'custom_linear_percent.dart';

class BestSellerItem extends StatefulWidget {
  const BestSellerItem({super.key, required this.food,});
  final FoodEntity food;


  @override
  State<BestSellerItem> createState() => _BestSellerItemState();
}

class _BestSellerItemState extends State<BestSellerItem> {
  late bool favourite = widget.food.favourite;
  late bool cart = widget.food.cart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // GoRouter.of(context).push(AppRouter.kFoodDetails);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetails(
                food: widget.food,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          height: 260,
          width: MediaQuery.of(context).size.width<600? MediaQuery.of(context).size.width: 600,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.white.withOpacity(.3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15, top: 15, bottom: 0),
                child: Row(
                  children: [
                    FoodImage(widget: widget),
                    const SizedBox(
                      width: 20,
                    ),
                    FoodInfo(widget: widget),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black.withOpacity(.1),
                          ),
                          child: IconButton(
                            onPressed: () {
                              changeFavorite(context);
                            },
                            icon: favourite
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_border),
                            // icon: Icon(Icons.favorite_border),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:cart? Colors.amber.withOpacity(.5):Colors.black.withOpacity(.1),
                          ),
                          child: IconButton(
                            onPressed: () {
                              changeCart(context);
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.opencart,
                              color: Colors.black,
                            ),
                            // icon: Icon(Icons.favorite_border),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const LinearPercent(),
            ],
          ),
        ),
      ),
    );
  }

  void changeCart(BuildContext context) {
            setState(() {
      if (cart) {
        cart = false;
        CartCubit.get(context)
            .removeFromCart(
            food: widget.food, context: context);
      } else {
        cart = true;
        CartCubit.get(context).addToCart(
            food: widget.food,context: context);
      }
    });
  }

  void changeFavorite(BuildContext context) {
      setState(() {
      if (favourite) {
        favourite = false;
        FavouriteCubit.get(context)
            .removeFromFavourite(
            food: widget.food, context: context);
      } else {
        favourite = true;
        FavouriteCubit.get(context).addToFavourite(
            food: widget.food,context: context);
      }
    });
  }
}

class FoodImage extends StatelessWidget {
  const FoodImage({
    super.key,
    required this.widget,
  });

  final BestSellerItem widget;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 45,
      backgroundColor: Colors.black.withOpacity(.1),
      child: Image.network(widget.food.imageUrl!),
    );
  }
}

class FoodInfo extends StatelessWidget {
  const FoodInfo({
    super.key,
    required this.widget,
  });

  final BestSellerItem widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.food.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle18,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              widget.food.subTitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle14,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '\$ ${widget.food.price}',
              style: Styles.textStyle18,
            ),
          ],
        ),
      ),
    );
  }
}

class LinearPercent extends StatelessWidget {
  const LinearPercent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 8.0, right: 8, top: 0, bottom: 8),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.black.withOpacity(.05),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15.0, vertical: 15),
            child: Column(
              children: [
                LinearPercentIndicator(
                  percent: .75,
                  backgroundColor: Colors.black12,
                  progressColor: Colors.black,
                  leading: const Text(
                    '0',
                    style: Styles.textStyle12,
                  ),
                  center: Text(
                    '850 Calories',
                    style: Styles.textStyle12
                        .copyWith(color: Colors.white),
                  ),
                  trailing: const Text(
                    '1000',
                    style: Styles.textStyle12,
                  ),
                  barRadius: const Radius.circular(20),
                  lineHeight: 20,
                  animation: true,
                  animationDuration: 1500,
                  curve: Curves.easeOutBack,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomLinear(
                  head: 'Protein',
                  tail: '100 %',
                  percent: .75,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomLinear(
                  head: 'Carb',
                  tail: '100 %',
                  percent: .5,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomLinear(
                  head: 'Fats',
                  tail: '100 %',
                  percent: .25,
                ),
              ],
            ),
          )),
    );
  }
}


