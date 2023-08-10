import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_entity.freezed.dart';

part 'menu_item_entity.g.dart';

@freezed
class MenuItemEntity with _$MenuItemEntity {
  factory MenuItemEntity({
    required int id,
    required String title,
    required double cost,
    required String image,
    required String description,
    required List<String> ingredients,
    required String category,
  }) = _MenuItemEntity;

  factory MenuItemEntity.fromJson(Map<String, dynamic> json) {
    return _$MenuItemEntityFromJson(json);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'cost': cost,
      'image': image,
      'description': description,
      'ingredients': ingredients,
      'category': category,
    };
  }
}
