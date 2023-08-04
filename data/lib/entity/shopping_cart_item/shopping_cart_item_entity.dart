import 'package:data/data.dart';

class ShoppingCartItemEntity {
  final MenuItemEntity menuItemEntity;
  final int amount;

  ShoppingCartItemEntity({
    required this.menuItemEntity,
    required this.amount,
  });

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
