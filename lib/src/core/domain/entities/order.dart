import 'menu_position.dart';

class Order {
  final double price;
  final String cafeName;
  final String address;
  final String? comment;
  final String userName;
  final List<MenuPosition> positions;

  Order({
    required this.price,
    required this.cafeName,
    required this.address,
    this.comment,
    required this.userName,
    required this.positions,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      price: json['price'],
      cafeName: json['cafeName'],
      address: json['address'],
      comment: json['comment'],
      positions: (json['positions'] as List)
          .map((e) => MenuPosition.fromJson(e))
          .toList(),
      userName: json['userName'],
    );
  }
}

extension OrderSerialization on Order {
  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'cafeName': cafeName,
      'positions': positions.map((e) => e.toJson()).toList(),
      'comment': comment,
      'address': address,
      'userName': userName,
    };
  }
}
