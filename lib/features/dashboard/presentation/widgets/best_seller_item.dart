import 'package:ez_eat/core/style/textStyles.dart';
import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/food_details.dart';
import '../../../favourite/presentation/manager/favourite_cubit/favourite_cubit.dart';
import '../manager/dashboard_cubit/dashboard_cubit.dart';

class BestSellerItem extends StatefulWidget {
  const BestSellerItem({super.key, required this.food,});
  final FoodEntity food;


  @override
  State<BestSellerItem> createState() => _BestSellerItemState();
}

class _BestSellerItemState extends State<BestSellerItem> {
  late bool favourite = widget.food.favourite;

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
          height: MediaQuery.of(context).size.height * .22,
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
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.black.withOpacity(.1),
                      child: Image.network(widget.food.imageUrl!),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
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
                    ),
                    Column(
                      children: [
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
                                      food: widget.food, context: context);
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
                            // icon: Icon(Icons.favorite_border),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black.withOpacity(.1),
                          ),
                          child: IconButton(
                            onPressed: () {},
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
              Padding(
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
                          const _CustomLinear(
                            head: 'Protein',
                            tail: '100 %',
                            percent: .75,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const _CustomLinear(
                            head: 'Carb',
                            tail: '100 %',
                            percent: .5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const _CustomLinear(
                            head: 'Fats',
                            tail: '100 %',
                            percent: .25,
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomLinear extends StatelessWidget {
  const _CustomLinear({
    required this.head,
    required this.tail,
    required this.percent,
  });
  final String head;
  final String tail;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 50),
      child: LinearPercentIndicator(
        percent: percent,
        backgroundColor: Colors.black12,
        progressColor: Colors.black54,
        leading: SizedBox(
          width: 42,
          child: Text(
            head,
            style: Styles.textStyle12,
          ),
        ),
        trailing: Text(
          tail,
          style: Styles.textStyle12,
        ),
        barRadius: const Radius.circular(20),
        lineHeight: 5,
        animation: true,
        animationDuration: 1500,
        curve: Curves.easeOutBack,
      ),
    );
  }
}
