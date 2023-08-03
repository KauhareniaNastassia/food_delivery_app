import 'package:domain/domain.dart';

abstract class ShoppingCartRepository {
  Future<List<ShoppingCartItemModel>> getShoppingCartItems();

  Future<void> addShoppingCartItem(MenuItemModel menuItemModel);

  Future<void> removeShoppingCartItem(
    ShoppingCartItemModel shoppingCartItemModel,
  );
}
