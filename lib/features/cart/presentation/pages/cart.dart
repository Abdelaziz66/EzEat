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
    return BlocProvider(
      create: (context) =>
          PaymentCubit(
              paymentUseCase: PaymentUseCase(paymentRepo: PaymentRepoImpl())),

      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return const CartBody();
        },
      ),
    );
  }
}
