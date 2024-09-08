import 'package:flutter/material.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/custom_title.dart';
import 'cart_gridview.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Titles(title: Strings.cartTitle, subtitle: Strings.cartSubTitle,),
        CartGridView(),
      ],

    );
  }
}

