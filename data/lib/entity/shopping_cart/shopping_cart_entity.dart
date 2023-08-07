import 'package:data/data.dart';

class ShoppingCartEntity {
  final List<ShoppingCartItemEntity> shoppingCartItems;
  final double totalPrice;
  final bool addCutlery;

  ShoppingCartEntity({
    required this.shoppingCartItems,
    required this.totalPrice,
    required this.addCutlery,
  });

  factory ShoppingCartEntity.fromJson(Map<String, dynamic> json) {
    return ShoppingCartEntity(
      shoppingCartItems: (json['shoppingCartItems'] as List<dynamic>)
          .map((shoppingCartItem) =>
              ShoppingCartItemEntity.fromJson(shoppingCartItem))
          .toList(),
      totalPrice: json['totalPrice'],
      addCutlery: json['addCutlery'],
    );
  }

  Map<String, dynamic> toMap() => {
        'shoppingCartItems': shoppingCartItems
            .map((shoppingCartItem) => shoppingCartItem.toMap())
            .toList(),
        'totalPrice': totalPrice,
        'addCutlery': addCutlery,
      };

  Map<String, dynamic> toJson() => {
        'shoppingCartItems': shoppingCartItems
            .map((shoppingCartItem) => shoppingCartItem.toJson())
            .toList(),
        'totalPrice': totalPrice,
        'addCutlery': addCutlery,
      };
}
