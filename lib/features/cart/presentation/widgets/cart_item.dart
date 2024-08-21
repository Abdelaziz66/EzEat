import 'package:ez_eat/core/style/textStyles.dart';
import 'package:ez_eat/features/dashboard/domain/entities/food_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/functions/custom_alert.dart';
import '../../../../core/utils/app_router.dart';
import '../../../favourite/presentation/manager/favourite_cubit/favourite_cubit.dart';
import '../../../layout/presentation/manager/layout_cubit/layout_cubit.dart';
import '../manager/cart_cubit/cart_cubit.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.food});
  final FoodEntity food;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late bool favourite = widget.food.favourite;
  int counter = 1;
  bool confirm = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kFoodDetails, extra: widget.food);
      },
      child: Container(
        height: 210,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.white.withOpacity(.3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
              child: Row(
                children: [
                  _FoodImage(widget: widget),
                  const SizedBox(
                    width: 20,
                  ),
                  _FoodInfo(widget: widget),
                  const Spacer(),
                  Column(
                    children: [
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
                          onPressed: () {
                            _clickOnDelete(context);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          // icon: Icon(Icons.favorite_border),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black.withOpacity(.05),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 3),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.pinkAccent.withOpacity(.3),
                          child: IconButton(
                            onPressed: () {
                              _clickOnMinus();
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.black.withOpacity(.05),
                            child: Text(
                              '$counter',
                              style: Styles.textStyle18,
                            )),
                        const SizedBox(
                          width: 3,
                        ),
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.tealAccent.withOpacity(.4),
                          child: IconButton(
                            onPressed: () {
                              _clickOnPlus();
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7.0, vertical: 2),
                          child: Column(
                            children: [
                              const Text(
                                'Total Price',
                                style: Styles.textStyle12,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                '${counter * widget.food.price!} \$',
                                style: Styles.textStyle14,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            _clickOnConfirm();
                          },
                          child: _Confirm(confirm: confirm),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _clickOnConfirm() {
    if (uId == null) {
      customAlert(
          context: context,
          text: 'Login to confirm your order',
          no: () {
            GoRouter.of(context).pop();
          },
          yes: () {
            GoRouter.of(context).pop();
            GoRouter.of(context).push(AppRouter.kLoginOrRegister);
            LayoutCubit.get(context).currentNavigationBarIndex=0;
          });
    } else {
      setState(() {
        confirm = !confirm;
      });
    }
  }



  void _clickOnPlus() {
    setState(() {
      counter++;
    });
  }

  void _clickOnMinus() {
    if (counter != 1) {
      setState(() {
        counter--;
      });
    }
  }

  void _clickOnDelete(BuildContext context) {
    CartCubit.get(context).removeFromCart(food: widget.food, context: context);
  }

  void _clickOnFavourite(BuildContext context) {
    setState(() {
      if (favourite) {
        favourite = false;
        FavouriteCubit.get(context)
            .removeFromFavourite(food: widget.food, context: context);
      } else {
        favourite = true;
        FavouriteCubit.get(context)
            .addToFavourite(food: widget.food, context: context);
      }
    });
  }
}

class _Confirm extends StatelessWidget {
  const _Confirm({
    required this.confirm,
  });

  final bool confirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: confirm ? Colors.redAccent : Colors.teal,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.zero,
          bottomRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 5, top: 5, bottom: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              confirm ? 'cancel' : 'Confirm',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                child: Icon(
                  confirm ? Icons.cancel : Icons.send,
                  color: confirm ? Colors.redAccent : Colors.teal,
                  size: 25,
                )),
          ],
        ),
      ),
    );
  }
}

class _FoodInfo extends StatelessWidget {
  const _FoodInfo({
    required this.widget,
  });

  final CartItem widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            '\$ ${widget.food.price!}',
            style: Styles.textStyle18,
          ),
        ],
      ),
    );
  }
}

class _FoodImage extends StatelessWidget {
  const _FoodImage({
    required this.widget,
  });

  final CartItem widget;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 45,
      backgroundColor: Colors.black.withOpacity(.1),
      child: Image.network(
        '${widget.food.imageUrl}',
        height: 190,
      ),
    );
  }
}
