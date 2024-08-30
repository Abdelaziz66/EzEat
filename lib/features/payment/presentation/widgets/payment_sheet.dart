import 'package:ez_eat/features/payment/presentation/widgets/payment_method_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/functions/custom_dialog.dart';
import '../../../../core/functions/show_flutter_toast_message.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/payment_intent_input_model.dart';
import '../manager/payment_cubit.dart';
import '../manager/payment_state.dart';
import '../pages/thank_you.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet(
      {super.key, required this.price, required this.counter});
  final num price;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          const PaymentMethodsListView(),
          const SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer(function: () {
            PaymentCubit cubit = PaymentCubit.get(context);
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
                    amount: '${counter * price}00', currency: 'USD');
            cubit.createPayment(
                paymentIntentInputModel: paymentIntentInputModel);


          }),
        ],
      ),
    );
  }
}

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.function,
  });

  final Function function;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
          if (state is PaymentErrorState) {
            GoRouter.of(context).pop();
            showFlutterToastMessage(message: 'Payment Failed');
        }
        if (state is PaymentSuccessState) {
          GoRouter.of(context).pop();
          customDialog(context: context, widget: const ThankYou());
          showFlutterToastMessage(message: 'Payment Success');
        }
      },
      builder: (context, state) {
        return state is PaymentLoadingState
            ? const Center(child: CircularProgressIndicator())
            : CustomButton(
                text: 'Continue',
                onTap: function,
              );
      },
    );
  }
}
