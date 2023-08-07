import 'package:data/data.dart';

class OrderItemEntity {
  final int id;
  final String userId;
  final ShoppingCartEntity shoppingCart;
  final String date;

  OrderItemEntity({
    required this.id,
    required this.userId,
    required this.shoppingCart,
    required this.date,
  });

  factory OrderItemEntity.fromJson(Map<String, dynamic> json) {
    return OrderItemEntity(
      id: json['id'],
      userId: json['userId'],
      shoppingCart: ShoppingCartEntity.fromJson(json['shoppingCart']),
      date: json['date'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'userId': userId,
        'shoppingCart': shoppingCart.toMap(),
        'date': date,
      };
}
