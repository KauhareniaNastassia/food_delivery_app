import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_cart_item_model.freezed.dart';

@freezed
class ShoppingCartItemModel with _$ShoppingCartItemModel {
  factory ShoppingCartItemModel({
    required int id,
    required String title,
    required double cost,
    required String image,
    required String description,
    required List<String> ingredients,
  }) = _ShoppingCartItemModel;
}
