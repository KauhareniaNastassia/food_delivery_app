import 'package:domain/domain.dart';

abstract class ShoppingCartRepository {
  Future<List<ShoppingCartItemModel>> getShoppingCartItems(String userId);

  Future<void> addShoppingCartItem({
    required String userId,
    required MenuItemModel menuItemModel,
  });

  Future<void> removeShoppingCartItem({
    required String userId,
    required ShoppingCartItemModel shoppingCartItemModel,
  });

  Future<void> clearShoppingCart(String userId);
}
