import '../menu_item_model/menu_item_model.dart';

class ShoppingCartItemModel {
  final MenuItemModel menuItem;
  int amount;

  ShoppingCartItemModel({
    required this.menuItem,
    required this.amount,
  });

  ShoppingCartItemModel copyWith({
    MenuItemModel? menuItem,
    int? amount,
  }) {
    return ShoppingCartItemModel(
      menuItem: menuItem ?? this.menuItem,
      amount: amount ?? this.amount,
    );
  }

  List<Object?> get props => [
        menuItem,
        amount,
      ];
}
