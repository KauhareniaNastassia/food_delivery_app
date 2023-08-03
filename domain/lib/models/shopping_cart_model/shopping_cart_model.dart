import 'package:domain/domain.dart';

class ShoppingCartModel {
  final List<ShoppingCartItemModel> shoppingCartItems;
  final double totalPrice;
  final bool addCutlery;

  const ShoppingCartModel({
    required this.shoppingCartItems,
    required this.totalPrice,
    required this.addCutlery,
  });

  ShoppingCartModel copyWith({
    List<ShoppingCartItemModel>? shoppingCartItems,
    double? totalPrice,
    bool? addCutlery,
  }) {
    return ShoppingCartModel(
      shoppingCartItems: shoppingCartItems ?? this.shoppingCartItems,
      totalPrice: totalPrice ?? this.totalPrice,
      addCutlery: addCutlery ?? this.addCutlery,
    );
  }

  List<Object?> get props => [
        shoppingCartItems,
        totalPrice,
        addCutlery,
      ];
}
