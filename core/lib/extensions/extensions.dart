import 'package:domain/models/menu_item_model/menu_item_model.dart';

extension MenuItemModelExtensions on MenuItemModel {
  String getTitleByLanguage(String languageCode) {
    return titles
        .firstWhere((titleModel) => titleModel.languageCode == languageCode,
            orElse: () => titles.first)
        .title;
  }

  String getDescriptionByLanguage(String languageCode) {
    return descriptions
        .firstWhere(
            (descriptionModel) => descriptionModel.languageCode == languageCode,
            orElse: () => descriptions.first)
        .description;
  }

  List<String> getIngredientsByLanguage(String languageCode) {
    return ingredients
        .firstWhere(
            (ingredientsModel) => ingredientsModel.languageCode == languageCode,
            orElse: () => ingredients.first)
        .ingredientsList;
  }

  String getCategoryByLanguage(String languageCode) {
    return categories
        .firstWhere(
            (categoryModel) => categoryModel.languageCode == languageCode,
            orElse: () => categories.first)
        .category;
  }
}


/*
final title = menuItem.getTitleByLanguageCode(appLanguageCode).title;

// Get the description based on the app language
final description = menuItem.getDescriptionByLanguageCode(appLanguageCode).description;

// Get the category based on the app language
final category = menuItem.getCategoryByLanguageCode(appLanguageCode).category;

// Get the ingredients based on the app language
final ingredients = menuItem.getIngredientsByLanguageCode(appLanguageCode).ingredientsList;*/
