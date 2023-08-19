import 'dart:convert';
import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';

class MenuItemEntity {
  final int id;
  final List<MenuItemTitleEntity> titles;
  final double cost;
  final String image;
  final List<MenuItemDescriptionEntity> descriptions;
  final List<MenuItemIngredientsEntity> ingredients;
  final List<MenuItemCategoryEntity> categories;

  MenuItemEntity({
    required this.id,
    required this.titles,
    required this.cost,
    required this.image,
    required this.descriptions,
    required this.ingredients,
    required this.categories,
  });

  List<Object?> get props => [
        id,
        titles,
        cost,
        image,
        descriptions,
        ingredients,
        categories,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titles': titles,
      'cost': cost,
      'image': image,
      'descriptions': descriptions,
      'ingredients': ingredients,
      'categories': categories,
    };
  }

  factory MenuItemEntity.fromJson(Map<String, dynamic> json) {
    return MenuItemEntity(
      id: json['id'] ?? '',
      titles: (json['titles'] as List<dynamic>)
          .map((titleItemJson) => MenuItemTitleEntity.fromJson(titleItemJson))
          .toList(),
      cost: json['cost'] ?? 0.0,
      image: json['image'] ?? '',
      descriptions: (json['descriptions'] as List<dynamic>)
          .map((descriptionItemJson) =>
              MenuItemDescriptionEntity.fromJson(descriptionItemJson))
          .toList(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((ingredientItemJson) =>
              MenuItemIngredientsEntity.fromJson(ingredientItemJson))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((categoryItemJson) =>
              MenuItemCategoryEntity.fromJson(categoryItemJson))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titles': titles.map((title) => title.toMap()).toList(),
      'cost': cost,
      'image': image,
      'descriptions':
          descriptions.map((description) => description.toMap()).toList(),
      'ingredients':
          ingredients.map((ingredient) => ingredient.toMap()).toList(),
      'categories': categories.map((category) => category.toMap()).toList(),
    };
  }
}

class MenuItemTitleEntity {
  final String title;
  final String languageCode;

  const MenuItemTitleEntity({
    required this.title,
    required this.languageCode,
  });

  factory MenuItemTitleEntity.fromJson(Map<String, dynamic> json) {
    return MenuItemTitleEntity(
      title: json['title'],
      languageCode: json['languageCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'languageCode': languageCode,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'languageCode': languageCode,
    };
  }
}

class MenuItemDescriptionEntity {
  final String description;
  final String languageCode;

  const MenuItemDescriptionEntity({
    required this.description,
    required this.languageCode,
  });

  factory MenuItemDescriptionEntity.fromJson(Map<String, dynamic> json) {
    /*log('MenuItemDescriptionEntity.fromJson');
    log(json.toString());*/
    return MenuItemDescriptionEntity(
      description: json['description'],
      languageCode: json['languageCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'languageCode': languageCode,
    };
  }
}

class MenuItemIngredientsEntity {
  final List<String> ingredientsList;
  final String languageCode;

  const MenuItemIngredientsEntity({
    required this.ingredientsList,
    required this.languageCode,
  });

  factory MenuItemIngredientsEntity.fromJson(Map<String, dynamic> json) {
    return MenuItemIngredientsEntity(
      ingredientsList: List<String>.from(json['ingredientsList']),
      languageCode: json['languageCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ingredientsList': ingredientsList,
      'languageCode': languageCode,
    };
  }
}

class MenuItemCategoryEntity {
  final String category;
  final String languageCode;

  const MenuItemCategoryEntity({
    required this.category,
    required this.languageCode,
  });

  factory MenuItemCategoryEntity.fromJson(Map<String, dynamic> json) {
    return MenuItemCategoryEntity(
      category: json['category'],
      languageCode: json['languageCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'languageCode': languageCode,
    };
  }
}
