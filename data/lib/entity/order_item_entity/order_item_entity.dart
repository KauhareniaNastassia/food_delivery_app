import 'package:data/data.dart';

class OrderItemEntity {
  final int id;
  final ShoppingCartEntity shoppingCart;
  final String date;

  const OrderItemEntity({
    required this.id,
    required this.shoppingCart,
    required this.date,
  });

  factory OrderItemEntity.fromJson(Map<String, dynamic> json) {
    return OrderItemEntity(
      id: json['id'],
      shoppingCart: ShoppingCartEntity.fromJson(json['shoppingCart']),
      date: json['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'shoppingCart': shoppingCart.toMap(),
      'date': date,
    };
  }
}
