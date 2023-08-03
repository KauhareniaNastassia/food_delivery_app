import 'package:data/data.dart';
import 'package:domain/domain.dart';

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
