class PaymentIntentInputModel{
  final String amount;
  final String currency;
  final String customerId;
  final int quantity;


  PaymentIntentInputModel({required this.quantity,required this.customerId,required this.amount, required this.currency});

 Map<String,dynamic> toJson(){
    return {
      'amount': '${amount}00',
      'currency':currency,
      'customer': customerId

    };
  }

}