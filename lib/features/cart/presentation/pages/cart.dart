import 'package:ez_eat/core/functions/show_flutter_toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../payment/data/repositories/payment_repo_impl.dart';
import '../../../payment/domain/use_cases/payment_usecase.dart';
import '../../../payment/presentation/manager/payment_cubit.dart';
import '../widgets/cart_body.dart';


class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (State is PaymentErrorState) {
          print(
              '____________________________________________________________________________________________________');
          showFlutterToastMessage(message: 'Payment Failed');
        }
        if (State is PaymentSuccessState) {
          print(
              '____________________________________________________________________________________________________');
          showFlutterToastMessage(message: 'Payment Success');
        }
      },
      builder: (context, state) {
        return CartBody();
      },
    );
  }
}
