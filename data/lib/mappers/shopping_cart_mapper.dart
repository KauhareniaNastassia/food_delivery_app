import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class ShoppingCartMapper {
  static ShoppingCartEntity toEntity(ShoppingCartModel model) {
    return ShoppingCartEntity(
      shoppingCartItems: model.shoppingCartItems
          .map(
            (shoppingCartItem) => ShoppingCartItemEntity(
              menuItemEntity:
                  MenuItemMapper.toEntity(shoppingCartItem.menuItem),
              amount: shoppingCartItem.amount,
            ),
          )
          .toList(),
      totalPrice: model.totalPrice,
      addCutlery: model.addCutlery,
    );
  }

  static ShoppingCartModel toModel(ShoppingCartEntity entity) {
    return ShoppingCartModel(
      shoppingCartItems: entity.shoppingCartItems
          .map(
            (shoppingCartItem) => ShoppingCartItemModel(
              menuItem: MenuItemMapper.toModel(shoppingCartItem.menuItemEntity),
              amount: shoppingCartItem.amount,
            ),
          )
          .toList(),
      totalPrice: entity.totalPrice,
      addCutlery: entity.addCutlery,
    );
  }
}
