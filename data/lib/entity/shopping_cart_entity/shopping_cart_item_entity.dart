import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_cart_item_entity.freezed.dart';
part 'shopping_cart_item_entity.g.dart';

@freezed
class ShoppingCartItemEntity with _$ShoppingCartItemEntity {
  factory ShoppingCartItemEntity({
    required int id,
    required String title,
    required double cost,
    required String image,
    required String description,
    required List<String> ingredients,
  }) = _ShoppingCartItemEntity;

  factory ShoppingCartItemEntity.fromJson(Map<String, Object?> json) =>
      _$ShoppingCartItemEntityFromJson(json);
}