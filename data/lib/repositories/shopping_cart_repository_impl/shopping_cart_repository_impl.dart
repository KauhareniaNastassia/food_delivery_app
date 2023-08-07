import 'package:data/data.dart';
import 'package:domain/domain.dart';

class ShoppingCartRepositoryImpl implements ShoppingCartRepository {
  final LocalShoppingCartProvider _localShoppingCartProvider;

  ShoppingCartRepositoryImpl({
    required LocalShoppingCartProvider localShoppingCartProvider,
  }) : _localShoppingCartProvider = localShoppingCartProvider;

  @override
  Future<List<ShoppingCartItemModel>> getShoppingCartItems() async {
    final List<ShoppingCartItemEntity> shoppingCartItems =
        await _localShoppingCartProvider.getShoppingCartItemsFromLocal();

    return shoppingCartItems
        .map(
          (ShoppingCartItemEntity e) => ShoppingCartItemMapper.toModel(e),
        )
        .toList();
  }

  @override
  Future<void> addShoppingCartItem(MenuItemModel menuItemModel) async {
    final MenuItemEntity menuItemEntity =
        MenuItemMapper.toEntity(menuItemModel);

    await _localShoppingCartProvider.addShoppingCartItemToLocal(menuItemEntity);
  }

  @override
  Future<void> removeShoppingCartItem(
      ShoppingCartItemModel shoppingCartItemModel) async {
    final ShoppingCartItemEntity shoppingCartItemEntity =
        ShoppingCartItemMapper.toEntity(shoppingCartItemModel);

    await _localShoppingCartProvider
        .removeShoppingCartItemFromLocal(shoppingCartItemEntity);
  }

  @override
  Future<void> clearShoppingCart() async {
    await _localShoppingCartProvider.clearShoppingCart();
  }
}
