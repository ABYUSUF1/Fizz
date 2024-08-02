import 'price.dart';

class Node {
  Price? price;

  Node({this.price});

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        price: json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'price': price?.toJson(),
      };
}
