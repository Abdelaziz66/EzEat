import 'package:ez_eat/core/constants/constant.dart';
import 'package:ez_eat/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ez_eat/features/payment/presentation/widgets/payment_method_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/functions/custom_dialog.dart';
import '../../../../core/functions/paypal/get_transctions.dart';
import '../../../../core/functions/paypal/paypal_payment.dart';
import '../../../../core/functions/custom_snack_bar_message.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/stripe_model/payment_intent_input_model.dart';
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
            _executePayment(context);
          }),
        ],
      ),
    );
  }

  void _executePayment(BuildContext context) {
    PaymentCubit cubit = PaymentCubit.get(context);
    PaymentIntentInputModel? paymentIntentInputModel;
    if (CartCubit.get(context).activePaymentIndex == 0) {
      paymentIntentInputModel = PaymentIntentInputModel(
          quantity: counter,
          amount: '${price*counter}',
          currency: 'USD',
          customerId: customerId!);
      cubit.createPayment(
          paymentIntentInputModel: paymentIntentInputModel);
    } else if (CartCubit.get(context).activePaymentIndex == 1) {
      paymentIntentInputModel = PaymentIntentInputModel(
          quantity: counter,
          amount: '$price',
          currency: 'USD',
          customerId: customerId!);
      executePaypalPayment(
          context: context,
          transactionsData: getTransactionsData(
              paymentIntentInputModel: paymentIntentInputModel));
    }
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
          showSnackBar(message: 'Payment Failed', context: context);
        }
        if (state is PaymentSuccessState) {
          GoRouter.of(context).pop();
          customDialog(context: context, widget: const ThankYou());
          showSnackBar(message: 'Payment Success', context: context);
        }
      },
      builder: (context, state) {
        return state is PaymentLoadingState
            ? const SizedBox(
                height: 70, child: Center(child: CircularProgressIndicator()))
            : CustomButton(
                text: 'Continue',
                onTap: function,
              );
      },
    );
  }
}
