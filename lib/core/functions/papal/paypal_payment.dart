import 'dart:developer';
import 'package:ez_eat/core/functions/papal/paypal_checkout_view.dart';
import 'package:flutter/material.dart';
import '../../../features/cart/presentation/pages/cart.dart';
import '../../../features/payment/data/models/paypal_model/amount_model.dart';
import '../../../features/payment/data/models/paypal_model/item_list_model.dart';
import '../../../features/payment/presentation/pages/thank_you.dart';
import '../../utils/api_keys.dart';

void executePaypalPayment({required  context,
    required ({AmountModel amount, ItemListModel itemList}) transactionsData}) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: ApiKeys.clientID,
      secretKey: ApiKeys.paypalSecretKey,
      transactions: [
        {
          "amount": transactionsData.amount.toJson(),
          "description": "The payment transaction description.",
          "item_list": transactionsData.itemList.toJson(),
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) {
            return const ThankYou();
          }),
          (route) {
            if (route.settings.name == '/') {
              return true;
            } else {
              return false;
            }
          },
        );
      },
      onError: (error) {
        SnackBar snackBar = SnackBar(content: Text(error.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) {
            return const Cart();
          }),
              (route) {
            return false;
          },
        );
      },
      onCancel: () {
        print('cancelled:');
        Navigator.pop(context);
      },
    ),
  ));
}
