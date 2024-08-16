import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:ez_eat/features/dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../features/favourite/presentation/manager/favourite_cubit/favourite_cubit.dart';
import '../style/textStyles.dart';
import 'background.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({super.key, required this.food,});
  final FoodEntity food;


  @override
  State<FoodDetails> createState() =>
      _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  late bool favourite = widget.food.favourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
        widget: SafeArea(
          child: Container(
            color: Colors.white.withOpacity(.1),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 35,
                        ),
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.black.withOpacity(.1),
                      child: Image.network(widget.food.imageUrl!),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              widget.food.title!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textStyle25,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.access_time),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            '25 Mins',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black.withOpacity(.1),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (favourite) {
                                    favourite = false;
                                    FavouriteCubit.get(context)
                                        .removeFromFavourite(
                                            food: widget.food,context: context);
                                  } else {
                                    favourite = true;
                                    FavouriteCubit.get(context).addToFavourite(
                                        food: widget.food,context: context);
                                  }
                                });
                              },
                              icon: favourite
                                  ? const Icon(Icons.favorite)
                                  : const Icon(Icons.favorite_border),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.food.subTitle!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle14,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _CustomCircularPercent(
                            center: '40',
                            footer: 'Protein',
                            percent: .40,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          _CustomCircularPercent(
                            center: '25',
                            footer: 'Carb',
                            percent: .25,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          _CustomCircularPercent(
                            center: '35',
                            footer: 'Fats',
                            percent: .35,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Total Price',
                                style: Styles.textStyle17,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\$ ${widget.food.price}',
                                style: Styles.textStyle17,
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.zero,
                                  bottomRight: Radius.circular(35),
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 17, left: 25, top: 17.0, bottom: 17),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Add to Cart',
                                      style: Styles.textStyle17
                                          .copyWith(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    CircleAvatar(
                                        radius: 20,
                                        backgroundColor: true
                                            ? Colors.greenAccent
                                            : Colors.grey[300],
                                        child: const Icon(
                                          true
                                              ? Icons.check
                                              : Icons.shopping_cart,
                                          color: Colors.black,
                                          size: 30,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomCircularPercent extends StatelessWidget {
  const _CustomCircularPercent(
      {required this.center, required this.footer, required this.percent});
  final String center;
  final String footer;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 35,
      percent: percent,
      backgroundColor: Colors.black12,
      progressColor: Colors.black,
      lineWidth: 6.0,
      animation: true,
      animationDuration: 1500,
      curve: Curves.easeOutBack,
      circularStrokeCap: CircularStrokeCap.round,
      footer: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          footer,
          style: Styles.textStyle20,
        ),
      ),
      center: Text(
        center,
        style: Styles.textStyle20,
      ),
    );
  }
}
