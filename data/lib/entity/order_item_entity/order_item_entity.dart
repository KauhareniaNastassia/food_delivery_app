import 'package:data/data.dart';

class OrderItemEntity {
  final int id;
  final ShoppingCartEntity shoppingCart;
  final String date;
  final bool isCompleted;

  const OrderItemEntity({
    required this.id,
    required this.shoppingCart,
    required this.date,
    required this.isCompleted,
  });

  factory OrderItemEntity.fromJson(Map<String, dynamic> json) {
    return OrderItemEntity(
      id: json['id'],
      shoppingCart: ShoppingCartEntity.fromJson(json['shoppingCart']),
      date: json['date'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'shoppingCart': shoppingCart.toMap(),
      'date': date,
      'isCompleted': isCompleted,
    };
  }
}
