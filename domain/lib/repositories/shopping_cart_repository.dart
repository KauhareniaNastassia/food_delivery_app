import 'package:domain/domain.dart';

abstract class ShoppingCartRepository {
  Future<List<ShoppingCartItemModel>> getShoppingCartItems(String userId);

  Future<void> addShoppingCartItem(
    String userId,
    MenuItemModel menuItemModel,
  );

  Future<void> removeShoppingCartItem(
    String userId,
    ShoppingCartItemModel shoppingCartItemModel,
  );

  Future<void> clearShoppingCart(String userId);
}
