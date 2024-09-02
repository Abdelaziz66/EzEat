class InitPaymentSheetInputModel {
  final String clientSecret;
  final String customerId;
  final String ephemeralKeySecret;

  InitPaymentSheetInputModel(
      {required this.clientSecret,
      required this.customerId,
      required this.ephemeralKeySecret});
}
