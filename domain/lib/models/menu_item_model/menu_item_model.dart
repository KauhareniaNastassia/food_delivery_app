import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_model.freezed.dart';

@freezed
class MenuItemModel with _$MenuItemModel {
  factory MenuItemModel({
    required int id,
    required String title,
    required double cost,
    required String image,
    required String description,
    required List<String> ingredients,
  }) = _MenuItemModel;
}
