
import 'package:flutter/material.dart';

import 'cart_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.vertical,
          // shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return  const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: CartItem(),
            );
          },
        ),
      ),
    );
  }
}
