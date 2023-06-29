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
  }) = _MenuItemEntity;

  factory MenuItemEntity.fromJson(Map<String, Object?> json) =>
      _$MenuItemEntityFromJson(json);
}
