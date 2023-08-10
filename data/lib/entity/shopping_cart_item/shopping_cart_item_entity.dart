import 'package:data/data.dart';

class ShoppingCartItemEntity {
  final MenuItemEntity menuItemEntity;
  final int amount;

  const ShoppingCartItemEntity({
    required this.menuItemEntity,
    required this.amount,
  });

  factory ShoppingCartItemEntity.fromJson(Map<String, dynamic> json) {
    return ShoppingCartItemEntity(
      menuItemEntity: MenuItemEntity.fromJson(json['menuItemEntity']),
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'menuItemEntity': menuItemEntity.toMap(),
      'amount': amount,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'menuItemEntity': menuItemEntity.toJson(),
      'amount': amount,
    };
  }

  ShoppingCartItemEntity copyWith({
    MenuItemEntity? menuItemEntity,
    int? amount,
  }) {
    return ShoppingCartItemEntity(
      menuItemEntity: menuItemEntity ?? this.menuItemEntity,
      amount: amount ?? this.amount,
    );
  }
}
