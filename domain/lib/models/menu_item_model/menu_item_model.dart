import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_model.freezed.dart';

/*@freezed
class MenuItemModel with _$MenuItemModel {
  factory MenuItemModel({
    required int id,
    required String title,
    required double cost,
    required String image,
    required String description,
    required List<String> ingredients,
    required String category,
  }) = _MenuItemModel;
}*/

@freezed
class MenuItemModel with _$MenuItemModel {
  factory MenuItemModel({
    required int id,
    required List<MenuItemTitleModel> titles,
    required double cost,
    required String image,
    required List<MenuItemDescriptionModel> descriptions,
    required List<MenuItemIngredientsModel> ingredients,
    required List<MenuItemCategoryModel> categories,
  }) = _MenuItemModel;
}

class MenuItemTitleModel {
  final String title;
  final String languageCode;

  MenuItemTitleModel({
    required this.title,
    required this.languageCode,
  });

  MenuItemTitleModel copyWith({
    String? title,
    String? languageCode,
  }) {
    return MenuItemTitleModel(
      title: title ?? this.title,
      languageCode: languageCode ?? this.languageCode,
    );
  }

  List<Object?> get props => [
        title,
        languageCode,
      ];
}

class MenuItemDescriptionModel {
  final String description;
  final String languageCode;

  MenuItemDescriptionModel({
    required this.description,
    required this.languageCode,
  });

  MenuItemDescriptionModel copyWith({
    String? description,
    String? languageCode,
  }) {
    return MenuItemDescriptionModel(
      description: description ?? this.description,
      languageCode: languageCode ?? this.languageCode,
    );
  }

  List<Object?> get props => [
        description,
        languageCode,
      ];
}
class MenuItemIngredientsModel {
  final List<String> ingredientsList;
  final String languageCode;

  MenuItemIngredientsModel({
    required this.ingredientsList,
    required this.languageCode,
  });

  MenuItemIngredientsModel copyWith({
    List<String>? ingredientsList,
    String? languageCode,
  }) {
    return MenuItemIngredientsModel(
      ingredientsList: ingredientsList ?? this.ingredientsList,
      languageCode: languageCode ?? this.languageCode,
    );
  }

  List<Object?> get props => [
    ingredientsList,
    languageCode,
  ];
}

class MenuItemCategoryModel {
  final String category;
  final String languageCode;

  MenuItemCategoryModel({
    required this.category,
    required this.languageCode,
  });

  MenuItemCategoryModel copyWith({
    String? category,
    String? languageCode,
  }) {
    return MenuItemCategoryModel(
      category: category ?? this.category,
      languageCode: languageCode ?? this.languageCode,
    );
  }
}