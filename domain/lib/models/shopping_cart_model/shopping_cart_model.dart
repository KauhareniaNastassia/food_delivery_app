import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:domain/models/shopping_cart_model/shopping_cart_item_model.dart';

class ShoppingCartModel {
  final List<MenuItemModel> shoppingCartItems;
  final int totalPrice;

  const ShoppingCartModel({
    required this.shoppingCartItems,
    required this.totalPrice,
  });

  ShoppingCartModel copyWith({
    List<MenuItemModel>? shoppingCartItems,
    int? totalPrice,
  }) {
    return ShoppingCartModel(
      shoppingCartItems: shoppingCartItems ?? this.shoppingCartItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  List<Object?> get props => [
    shoppingCartItems,
    totalPrice,
  ];
}