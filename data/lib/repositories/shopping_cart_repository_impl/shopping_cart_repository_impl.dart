import 'package:data/data.dart';
import 'package:domain/domain.dart';

class ShoppingCartRepositoryImpl implements ShoppingCartRepository {
  final HiveProvider _hiveProvider;

  ShoppingCartRepositoryImpl({
    required HiveProvider hiveProvider,
  }) : _hiveProvider = hiveProvider;

  @override
  Future<List<ShoppingCartItemModel>> getShoppingCartItems(
    String userId,
  ) async {
    final List<ShoppingCartItemEntity> shoppingCartItems =
        await _hiveProvider.getShoppingCartItemsFromLocal(userId);

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

    await _hiveProvider.addShoppingCartItemToLocal(
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

    await _hiveProvider.removeShoppingCartItemFromLocal(
      userId: userId,
      shoppingCartItemEntity: shoppingCartItemEntity,
    );
  }

  @override
  Future<void> clearShoppingCart(String userId) async {
    await _hiveProvider.clearShoppingCart(userId);
  }
}
