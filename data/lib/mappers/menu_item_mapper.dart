import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class MenuItemMapper {
  static MenuItemEntity toEntity(MenuItemModel model) {
    return MenuItemEntity(
      id: model.id,
      title: model.title,
      cost: model.cost,
      image: model.image,
      description: model.description,
      ingredients: model.ingredients,
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
    );
  }
}
