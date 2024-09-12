import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/widgets/food_details.dart';
import '../../../dashboard/domain/entities/food_entity.dart';
import '../manager/cart_cubit/cart_cubit.dart';
import '../manager/cart_cubit/cart_state.dart';
import 'cart_item.dart';

class CartGridView extends StatefulWidget {
  const CartGridView({super.key});

  @override
  State<CartGridView> createState() => _CartGridViewState();
}

class _CartGridViewState extends State<CartGridView> {
  List<FoodEntity> cart = ChangeCartSuccessState.cart;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GridView.builder(
              itemCount: cart.length,
              scrollDirection: Axis.vertical,
              // shrinkWrap: true,

              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return OpenContainer(
                    transitionDuration: const Duration(milliseconds: 500),
                    openColor: Colors.white,
                    closedColor: Colors.transparent,
                    closedElevation: 0,
                    openElevation: 0,
                    middleColor: Colors.white,
                    transitionType: ContainerTransitionType.fade,
                    closedBuilder: (BuildContext context,VoidCallback openContainer)=> Center(child: _cartItemBuilder(index, context,openContainer)),
                    openBuilder: (BuildContext context, _) =>FoodDetails(
                      food:cart[index],
                    ),

                   );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                mainAxisExtent: 210,
                crossAxisCount: MediaQuery.of(context).size.width < 800
                    ? 1
                    : MediaQuery.of(context).size.width >= 800 &&
                            MediaQuery.of(context).size.width < 1200
                        ? 2
                        : MediaQuery.of(context).size.width >= 1200 &&
                                MediaQuery.of(context).size.width < 1600
                            ? 3
                            : 4,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _cartItemBuilder(int index, BuildContext context,openContainer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Dismissible(
        key: ValueKey<FoodEntity>(cart[index]),
        onDismissed: (DismissDirection direction) {
          _swipeCartItem(context, index);
        },
        direction: DismissDirection.startToEnd,
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.transparent,
          ),
          alignment: Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(
              FontAwesomeIcons.trash,
              size: 35,
            ),
          ),
        ),
        child: CartItem(food: cart[index],onClick:openContainer,),
      ),
    );
  }

  void _swipeCartItem(BuildContext context, int index) {
    setState(() {
      CartCubit.get(context)
          .removeFromCart(food: cart[index], context: context);
    });
  }
}
