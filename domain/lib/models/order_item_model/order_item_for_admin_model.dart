import 'package:domain/domain.dart';

class OrderItemForAdminModel {
  final String userId;
  final String email;
  final OrderItemModel orderItem;

  const OrderItemForAdminModel({
    required this.userId,
    required this.email,
    required this.orderItem,
  });

  OrderItemForAdminModel copyWith({
    String? userId,
    String? email,
    OrderItemModel? orderItem,
  }) {
    return OrderItemForAdminModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      orderItem: orderItem ?? this.orderItem,
    );
  }

  List<Object?> get props => [
        userId,
        email,
        orderItem,
      ];
}
