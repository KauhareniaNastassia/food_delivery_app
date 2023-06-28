import 'package:domain/models/menu_item_model/menu_item_model.dart';

abstract class MenuRepository {
  Future<List<MenuItemModel>> fetchMenuItems();
}
