import 'package:ez_eat/core/functions/custom_snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../payment/presentation/manager/payment_cubit.dart';
import '../../../payment/presentation/manager/payment_state.dart';
import '../widgets/cart_body.dart';


class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartBody();
  }
}
