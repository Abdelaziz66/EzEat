
class CustomerModel {
  String? id;
  String? object;
  dynamic address;
  int? balance;
  int? created;
  dynamic currency;
  dynamic defaultSource;
  bool? delinquent;
  dynamic description;
  dynamic discount;
  dynamic email;
  String? invoicePrefix;
  InvoiceSettings? invoiceSettings;
  bool? livemode;
  Metadata? metadata;
  String? name;
  int? nextInvoiceSequence;
  dynamic phone;
  List<dynamic>? preferredLocales;
  dynamic shipping;
  String? taxExempt;
  dynamic testClock;

  CustomerModel({
    this.id,
    this.object,
    this.address,
    this.balance,
    this.created,
    this.currency,
    this.defaultSource,
    this.delinquent,
    this.description,
    this.discount,
    this.email,
    this.invoicePrefix,
    this.invoiceSettings,
    this.livemode,
    this.metadata,
    this.name,
    this.nextInvoiceSequence,
    this.phone,
    this.preferredLocales,
    this.shipping,
    this.taxExempt,
    this.testClock,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    id: json["id"],
    object: json["object"],
    address: json["address"],
    balance: json["balance"],
    created: json["created"],
    currency: json["currency"],
    defaultSource: json["default_source"],
    delinquent: json["delinquent"],
    description: json["description"],
    discount: json["discount"],
    email: json["email"],
    invoicePrefix: json["invoice_prefix"],
    invoiceSettings: json["invoice_settings"] == null ? null : InvoiceSettings.fromJson(json["invoice_settings"]),
    livemode: json["livemode"],
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
    name: json["name"],
    nextInvoiceSequence: json["next_invoice_sequence"],
    phone: json["phone"],
    preferredLocales: json["preferred_locales"] == null ? [] : List<dynamic>.from(json["preferred_locales"]!.map((x) => x)),
    shipping: json["shipping"],
    taxExempt: json["tax_exempt"],
    testClock: json["test_clock"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "address": address,
    "balance": balance,
    "created": created,
    "currency": currency,
    "default_source": defaultSource,
    "delinquent": delinquent,
    "description": description,
    "discount": discount,
    "email": email,
    "invoice_prefix": invoicePrefix,
    "invoice_settings": invoiceSettings?.toJson(),
    "livemode": livemode,
    "metadata": metadata?.toJson(),
    "name": name,
    "next_invoice_sequence": nextInvoiceSequence,
    "phone": phone,
    "preferred_locales": preferredLocales == null ? [] : List<dynamic>.from(preferredLocales!.map((x) => x)),
    "shipping": shipping,
    "tax_exempt": taxExempt,
    "test_clock": testClock,
  };
}

class InvoiceSettings {
  dynamic customFields;
  dynamic defaultPaymentMethod;
  dynamic footer;
  dynamic renderingOptions;

  InvoiceSettings({
    this.customFields,
    this.defaultPaymentMethod,
    this.footer,
    this.renderingOptions,
  });

  factory InvoiceSettings.fromJson(Map<String, dynamic> json) => InvoiceSettings(
    customFields: json["custom_fields"],
    defaultPaymentMethod: json["default_payment_method"],
    footer: json["footer"],
    renderingOptions: json["rendering_options"],
  );

  Map<String, dynamic> toJson() => {
    "custom_fields": customFields,
    "default_payment_method": defaultPaymentMethod,
    "footer": footer,
    "rendering_options": renderingOptions,
  };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
  );

  Map<String, dynamic> toJson() => {
  };
}
