import 'package:ez_eat/core/style/textStyles.dart';
import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/image_error.dart';
import '../../../cart/presentation/manager/cart_cubit/cart_cubit.dart';
import '../manager/favourite_cubit/favourite_cubit.dart';

class FavouriteItem extends StatefulWidget {
  const FavouriteItem({
    super.key,
    required this.food, required this.onClick,
  });
  final FoodEntity food;
  final VoidCallback onClick;


  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  late bool cart = widget.food.cart;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.onClick,
      child: SizedBox(
        width: 400,
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
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white.withOpacity(.3),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 20,
                              top: 25,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _Title(widget: widget),
                                _Subtitle(widget: widget),
                              ],
                            ),
                          ),
                        ),
                        // const Spacer(),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 10, bottom: 10),
                          child: Row(
                            children: [
                              _FoodPriceInfo(widget: widget),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  _clickOnCart(context);
                                },
                                child: _CustomButton(cart: cart),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            _FavouriteImage(widget: widget),
          ],
        ),
      ),
    );
  }

  void _clickOnCart(BuildContext context) {
    setState(() {
      if (cart) {
        cart = false;
        CartCubit.get(context)
            .removeFromCart(food: widget.food, context: context);
      } else {
        cart = true;
        CartCubit.get(context).addToCart(food: widget.food, context: context);
      }
    });
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({
    required this.widget,
  });

  final FavouriteItem widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 50.0),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.food.subTitle!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle14,
          ),
        ),
      ),
    );
  }
}

class _FoodPriceInfo extends StatelessWidget {
  const _FoodPriceInfo({
    required this.widget,
  });

  final FavouriteItem widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}

class _FavouriteIcon extends StatelessWidget {
  const _FavouriteIcon({
    required this.widget,
  });

  final FavouriteItem widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black.withOpacity(.1),
      ),
      child: IconButton(
        onPressed: () {
          _clickOnFavourite(context);
        },
        icon: const Icon(Icons.favorite),

        // icon: Icon(Icons.favorite_border),
      ),
    );
  }

  void _clickOnFavourite(BuildContext context) {
    FavouriteCubit.get(context)
        .removeFromFavourite(food: widget.food, context: context);
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.widget,
  });

  final FavouriteItem widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              widget.food.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle18,
            ),
          ),
          const SizedBox(width: 50),
          _FavouriteIcon(widget: widget),
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    required this.cart,
  });

  final bool cart;


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: cart? 160:180 ,
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
        padding:
            const EdgeInsets.only(right: 10, left: 25, top: 10.0, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 5,
            ),
            Text(
              !cart ? 'Add to Cart' : 'Remove',
              style: Styles.textStyle17.copyWith(color: Colors.white),
            ),
            const Spacer(),
            CircleAvatar(
                radius: 17,
                backgroundColor: !cart ? Colors.grey[300] : Colors.greenAccent,
                child: FaIcon(
                  !cart ? FontAwesomeIcons.opencart : FontAwesomeIcons.check,
                  color: Colors.black,
                  size: 20,
                )),
          ],
        ),
      ),
    );
  }
}

class _FavouriteImage extends StatelessWidget {
  const _FavouriteImage({
    required this.widget,
  });

  final FavouriteItem widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          '${widget.food.imageUrl}',
          errorBuilder: (context, error, stackTrace) => const ImageError(),
          height: 190,
        ),
      ],
    );
  }
}
