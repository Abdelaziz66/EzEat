import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
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
  late bool cart = widget.food.cart;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
        widget: SafeArea(
          child: Container(
            color: Colors.white.withOpacity(.1),

            child: Column(
              children: [
                const _BackIcon(),
                _FoodImage(widget: widget),
                const SizedBox(height: 15,),

                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width<600? MediaQuery.of(context).size.width: 600,
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
                              '25 Minutes',
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
                                  _clickOnFavourite(context);
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
                        const _ProteinFatsCarb(),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          children: [
                            _Price(widget: widget),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                  _clickOnAddToCart(context);
                              },
                              child: _AddToCartButton(cart: cart),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clickOnAddToCart(BuildContext context) {
     setState(() {
      if (cart) {
        cart = false;
        CartCubit.get(context)
            .removeFromCart(
            food: widget.food,context: context);
      } else {
        cart = true;
        CartCubit.get(context).addToCart(
            food: widget.food,context: context);
      }
    });
  }

  void _clickOnFavourite(BuildContext context) {
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
  }
}

class _BackIcon extends StatelessWidget {
  const _BackIcon();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class _Price extends StatelessWidget {
  const _Price({
    required this.widget,
  });

  final FoodDetails widget;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class _ProteinFatsCarb extends StatelessWidget {
  const _ProteinFatsCarb();

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton({
    required this.cart,
  });

  final bool cart;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            right: 13, left: 25, top: 13.0, bottom: 13),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              !cart?
              'Add to Cart':'Remove',
              style: Styles.textStyle17
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(
              width: 20,
            ),
            CircleAvatar(
                radius: 22,
                backgroundColor: !cart
                    ? Colors.grey[300]
                    : Colors.greenAccent,
                child:  Icon(
                  !cart
                      ? FontAwesomeIcons.opencart
                      : FontAwesomeIcons.check,
                  color: Colors.black,
                  size: 23,
                )),
          ],
        ),
      ),
    );
  }
}

class _FoodImage extends StatelessWidget {
  const _FoodImage({
    required this.widget,
  });

  final FoodDetails widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:  Colors.black.withOpacity(.1),
          ),
          child:Image.network(widget.food.imageUrl!),
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
