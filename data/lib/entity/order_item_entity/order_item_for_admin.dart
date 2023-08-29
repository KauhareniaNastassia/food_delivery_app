import 'package:data/data.dart';

class OrderItemForAdminEntity {
  final String userId;
  final String email;
  final OrderItemEntity orderItem;

  const OrderItemForAdminEntity({
    required this.userId,
    required this.email,
    required this.orderItem,
  });

  factory OrderItemForAdminEntity.fromJson(Map<String, dynamic> json) {
    return OrderItemForAdminEntity(
      userId: json['userId'],
      email: json['email'],
      orderItem: OrderItemEntity.fromJson(json['orderItem']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'orderItem': orderItem.toMap(),
    };
  }
}