import 'package:data/data.dart';

class ShoppingCartItemEntity {
  final MenuItemEntity menuItemEntity;
  int amount;

  ShoppingCartItemEntity({
    required this.menuItemEntity,
    required this.amount,
  });
}
