import 'package:domain/domain.dart';

import '../entity/shopping_cart_item/shopping_cart_item_entity.dart';
import 'menu_item_mapper.dart';

abstract class ShoppingCartItemMapper {
  static ShoppingCartItemEntity toEntity(ShoppingCartItemModel model) {
    return ShoppingCartItemEntity(
      menuItemEntity: MenuItemMapper.toEntity(
        model.menuItem,
      ),
      amount: model.amount,
    );
  }

  static ShoppingCartItemModel toModel(ShoppingCartItemEntity entity) {
    return ShoppingCartItemModel(
      menuItem: MenuItemMapper.toModel(
        entity.menuItemEntity,
      ),
      amount: entity.amount,
    );
  }
}
