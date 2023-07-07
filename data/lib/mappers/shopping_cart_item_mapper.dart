import 'package:domain/models/shopping_cart_model/shopping_cart_item_model.dart';

import '../entity/shopping_cart_entity/shopping_cart_item_entity.dart';

abstract class ShoppingCartItemMapper {
  static ShoppingCartItemEntity toEntity(ShoppingCartItemModel model) {
    return ShoppingCartItemEntity(
      id: model.id,
      title: model.title,
      cost: model.cost,
      image: model.image,
      description: model.description,
      ingredients: model.ingredients,
    );
  }

  static ShoppingCartItemModel toModel(ShoppingCartItemEntity entity) {
    return ShoppingCartItemModel(
      id: entity.id,
      title: entity.title,
      cost: entity.cost,
      image: entity.image,
      description: entity.description,
      ingredients: entity.ingredients,
    );
  }
}
