import 'package:ez_eat/core/style/textStyles.dart';
import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/food_details.dart';
import '../manager/favourite_cubit/favourite_cubit.dart';
import '../manager/favourite_cubit/favourite_state.dart';

class FavouriteItem extends StatefulWidget {
  const FavouriteItem({
    super.key,
    required this.food,
  });
  final FoodEntity food;

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  late bool favourite = widget.food.favourite;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteState>(
      listener: (context, state) {
        if (state is ChangeFavouriteSuccessState) {
          favourite=true;
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetails(
                    food: widget.food,
                  ),
                ));
          },
          child: SizedBox(
            height: 300,
            child: Stack(
              children: [
                Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white.withOpacity(.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 25, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Styles.textStyle14,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        if (favourite) {
                                          favourite = false;
                                          FavouriteCubit.get(context)
                                              .removeFromFavourite(
                                                  food: widget.food,
                                                  context: context);
                                        } else {
                                          favourite = true;
                                          FavouriteCubit.get(context)
                                              .addToFavourite(
                                                  food: widget.food,
                                                  context: context);
                                        }
                                      },
                                      icon: favourite
                                          ? const Icon(Icons.favorite)
                                          : const Icon(Icons.favorite_border),
                                      // icon: Icon(Icons.favorite_border),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Total Price',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '\$ ${widget.food.price!}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.zero,
                                          bottomRight: Radius.circular(35),
                                          topLeft: Radius.circular(35),
                                          topRight: Radius.circular(35),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10,
                                            left: 15,
                                            top: 10.0,
                                            bottom: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'Add to Cart',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black,
                                              ),
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
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      '${widget.food.imageUrl}',
                      height: 190,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
