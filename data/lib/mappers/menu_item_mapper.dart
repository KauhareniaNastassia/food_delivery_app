import 'package:data/data.dart';
import 'package:domain/domain.dart';
import '../entity/entities.dart';

/*abstract class MenuItemMapper {
  static MenuItemEntity toEntity(MenuItemModel model) {
    return MenuItemEntity(
      id: model.id,
      title: model.title,
      cost: model.cost,
      image: model.image,
      description: model.description,
      ingredients: model.ingredients,
      category: model.category,
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
      category: entity.category,
    );
  }
}*/

abstract class MenuItemMapper {
  static MenuItemEntity toEntity(MenuItemModel model) {
    return MenuItemEntity(
      id: model.id,
      titles: model.titles
          .map((titleItem) => MenuItemTitleEntity(
              title: titleItem.title, languageCode: titleItem.languageCode))
          .toList(),
      cost: model.cost,
      image: model.image,
      descriptions: model.descriptions
          .map((descriptionItem) => MenuItemDescriptionEntity(
              description: descriptionItem.description,
              languageCode: descriptionItem.languageCode))
          .toList(),
      ingredients: model.ingredients
          .map((ingredientsItem) => MenuItemIngredientsEntity(
          ingredientsList: ingredientsItem.ingredientsList,
              languageCode: ingredientsItem.languageCode))
          .toList(),
      categories: model.categories
          .map((categoryItem) => MenuItemCategoryEntity(
          category: categoryItem.category,
          languageCode: categoryItem.languageCode))
          .toList(),

      /*model.categories
          .map((categoryItem)) => MenuItemCategoryEntity(
          category: categoryItem.category,
          languageCode: categoryItem.languageCode))
          .toList(),*/
    );
  }

  static MenuItemModel toModel(MenuItemEntity entity) {
    return MenuItemModel(
      id: entity.id,
      titles: entity.titles
          .map((titleItem) => MenuItemTitleModel(
              title: titleItem.title, languageCode: titleItem.languageCode))
          .toList(),
      cost: entity.cost,
      image: entity.image,
      descriptions: entity.descriptions
          .map((descriptionItem) => MenuItemDescriptionModel(
              description: descriptionItem.description,
              languageCode: descriptionItem.languageCode))
          .toList(),
      ingredients: entity.ingredients
          .map((ingredientsItem) => MenuItemIngredientsModel(
          ingredientsList: ingredientsItem.ingredientsList,
              languageCode: ingredientsItem.languageCode))
          .toList(),
      categories: entity.categories
          .map((categoryItem) => MenuItemCategoryModel(
          category: categoryItem.category,
          languageCode: categoryItem.languageCode))
          .toList(),
    );
  }
}
