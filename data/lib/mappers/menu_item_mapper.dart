import 'package:domain/models/menu_item_model/menu_item_model.dart';

import '../entity/menu_item_entity.dart';

abstract class MenuItemMapper {
  static MenuItemEntity toEntity(MenuItemModel model) {
    return MenuItemEntity(
      id: model.id,
      title: model.title,
      cost: model.cost,
      image: model.image,
      description: model.description,
      ingredients: model.ingredients,
      amount: model.amount,
    );
  }

  static MenuItemModel toModel(MenuItemEntity entity) {
    return MenuItemModel(
      id: entity.id,
      title: entity.title,
      cost: entity.cost,
      image: entity.image,
      description: entity.description,
      ingredients: entity.ingredients,
      amount: entity.amount,
    );
  }
}
