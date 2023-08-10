import 'package:data/data.dart';
import 'package:domain/domain.dart';

class ShoppingCartRepositoryImpl implements ShoppingCartRepository {
  final LocalShoppingCartProvider _localShoppingCartProvider;

  ShoppingCartRepositoryImpl({
    required LocalShoppingCartProvider localShoppingCartProvider,
  }) : _localShoppingCartProvider = localShoppingCartProvider;

  @override
  Future<List<ShoppingCartItemModel>> getShoppingCartItems(
    String userId,
  ) async {
    final List<ShoppingCartItemEntity> shoppingCartItems =
        await _localShoppingCartProvider.getShoppingCartItemsFromLocal(userId);

    return shoppingCartItems
        .map(
          (ShoppingCartItemEntity e) => ShoppingCartItemMapper.toModel(e),
        )
        .toList();
  }

  @override
  Future<void> addShoppingCartItem({
    required String userId,
    required MenuItemModel menuItemModel,
  }) async {
    final MenuItemEntity menuItemEntity =
        MenuItemMapper.toEntity(menuItemModel);

    await _localShoppingCartProvider.addShoppingCartItemToLocal(
        userId: userId,
        menuItemEntity: menuItemEntity,
    );
  }

  @override
  Future<void> removeShoppingCartItem({
    required String userId,
    required ShoppingCartItemModel shoppingCartItemModel,
  }) async {
    final ShoppingCartItemEntity shoppingCartItemEntity =
        ShoppingCartItemMapper.toEntity(shoppingCartItemModel);

    await _localShoppingCartProvider.removeShoppingCartItemFromLocal(
        userId: userId,
        shoppingCartItemEntity: shoppingCartItemEntity,
    );
  }

  @override
  Future<void> clearShoppingCart(String userId) async {
    await _localShoppingCartProvider.clearShoppingCart(userId);
  }
}
