class Price {
  String? amount;
  String? currencyCode;

  Price({this.amount, this.currencyCode});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: json['amount'] as String?,
        currencyCode: json['currencyCode'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currencyCode': currencyCode,
      };
}
