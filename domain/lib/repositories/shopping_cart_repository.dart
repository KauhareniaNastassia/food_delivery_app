import '../models/menu_item_model/menu_item_model.dart';

abstract class ShoppingCartRepository {
  Future<List<MenuItemModel>> fetchShoppingCartItems();
}