import '../../../features/payment/data/models/paypal_model/amount_model.dart';
import '../../../features/payment/data/models/paypal_model/item_list_model.dart';
import '../../../features/payment/data/models/stripe_model/payment_intent_input_model.dart';

({AmountModel amount, ItemListModel itemList}) getTransactionsData({required PaymentIntentInputModel paymentIntentInputModel}) {
  var total=paymentIntentInputModel.amount*paymentIntentInputModel.quantity;
  var amount = AmountModel(
      total:total ,
      currency:  paymentIntentInputModel.currency,
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: total));

  List<OrderItemModel> orders = [
    OrderItemModel(
      currency: paymentIntentInputModel.currency,
      name: 'Food',
      price: paymentIntentInputModel.amount,
      quantity: paymentIntentInputModel.quantity,
    ),
  ];

  var itemList = ItemListModel(orders: orders);

  return (amount: amount, itemList: itemList);
}
