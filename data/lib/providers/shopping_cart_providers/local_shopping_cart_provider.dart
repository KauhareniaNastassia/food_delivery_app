import 'package:data/data.dart';

class LocalShoppingCartProvider {
  const LocalShoppingCartProvider();

  static final Box<ShoppingCartItemEntity> box = Hive.box('shoppingCartItems');

  Future<List<ShoppingCartItemEntity>> getShoppingCartItemsFromLocal() async {
    final Box<ShoppingCartItemEntity> shoppingCartItemsBox =
        await Hive.openBox('shoppingCartItems');
    final List<ShoppingCartItemEntity> shoppingCartItemsEntity =
        shoppingCartItemsBox.values.toList();
    return shoppingCartItemsEntity;
  }

  Future<void> addShoppingCartItemToLocal(
    MenuItemEntity menuItemEntity,
  ) async {
    final List<ShoppingCartItemEntity> shoppingCartItemsEntity =
        box.values.toList();
    int i = 0;
    bool itemIsInCart = false;

    while (i < shoppingCartItemsEntity.length && !itemIsInCart) {
      if (shoppingCartItemsEntity[i].menuItemEntity.id == menuItemEntity.id) {
        final ShoppingCartItemEntity updatedItem =
            shoppingCartItemsEntity[i].copyWith(
          amount: shoppingCartItemsEntity[i].amount + 1,
        );

        box.put(
          shoppingCartItemsEntity[i].menuItemEntity.id,
          updatedItem,
        );

        itemIsInCart = true;
      }
      i++;
    }

    if (!itemIsInCart) {
      box.put(
        menuItemEntity.id,
        ShoppingCartItemEntity(
          menuItemEntity: menuItemEntity,
          amount: 1,
        ),
      );
    }
  }

  Future<void> removeShoppingCartItemFromLocal(
    ShoppingCartItemEntity shoppingCartItemEntity,
  ) async {
    if (shoppingCartItemEntity.amount > 1) {
      final ShoppingCartItemEntity updatedItem =
          shoppingCartItemEntity.copyWith(
        amount: shoppingCartItemEntity.amount - 1,
      );
      await box.put(
        shoppingCartItemEntity.menuItemEntity.id,
        updatedItem,
      );
    } else {
      await box.delete(shoppingCartItemEntity.menuItemEntity.id);
    }
  }

  Future<void> clearShoppingCart() async {
    await box.clear();
  }
}
