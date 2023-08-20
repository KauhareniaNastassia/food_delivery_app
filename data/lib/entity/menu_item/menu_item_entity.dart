import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data.dart';
import '../entities.dart';

part 'menu_item_entity.freezed.dart';
part 'menu_item_entity.g.dart';

@freezed
@HiveType(typeId: 0, adapterName: 'MenuItemEntityAdapter')
class MenuItemEntity extends HiveObject with _$MenuItemEntity {

  MenuItemEntity._();

  factory MenuItemEntity({
    @HiveField(0) required int id,
    @HiveField(1) required List<MenuItemTitleEntity> titles,
    @HiveField(2) required double cost,
    @HiveField(3) required String image,
    @HiveField(4) required List<MenuItemDescriptionEntity> descriptions,
    @HiveField(5) required List<MenuItemIngredientsEntity> ingredients,
    @HiveField(6) required List<MenuItemCategoryEntity> categories,
  }) = _MenuItemEntity;

  factory MenuItemEntity.fromJson(Map<String, dynamic> json) =>
      _$MenuItemEntityFromJson(json);

  Map<String, dynamic> toMap() {
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
}

/*class MenuItemEntity {
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
}*/

