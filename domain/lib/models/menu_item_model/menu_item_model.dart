import 'package:core/constants/app_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_model.freezed.dart';

@freezed
class MenuItemModel with _$MenuItemModel {
  factory MenuItemModel({
    required String id,
    required String title,
    required double cost,
    required String image,
    required String description,
    required List<String> ingredients,
    required String category,
  }) = _MenuItemModel;

  static MenuItemModel empty() {
    return MenuItemModel(
      id: '',
      title: '',
      cost: 0.0,
      image: '',
      description: '',
      ingredients: [],
      category: AppConstants.noCategory,
    );
  }
}
