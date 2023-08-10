import 'package:data/data.dart';

class LocalShoppingCartProvider {
  const LocalShoppingCartProvider();

  Future<List<ShoppingCartItemEntity>> getShoppingCartItemsFromLocal(
      String userId) async {
    final Box<ShoppingCartItemEntity> shoppingCartItemsBox =
        await Hive.openBox(userId);
    final List<ShoppingCartItemEntity> shoppingCartItemsEntity =
        shoppingCartItemsBox.values.toList();
    return shoppingCartItemsEntity;
  }

  Future<void> addShoppingCartItemToLocal({
    required String userId,
    required MenuItemEntity menuItemEntity,
  }) async {
    final Box<ShoppingCartItemEntity> box = Hive.box(userId);
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

  Future<void> removeShoppingCartItemFromLocal({
    required String userId,
    required ShoppingCartItemEntity shoppingCartItemEntity,
  }) async {
    final Box<ShoppingCartItemEntity> box = Hive.box(userId);

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

  Future<void> clearShoppingCart(String userId) async {
    final Box<ShoppingCartItemEntity> box = Hive.box(userId);
    await box.clear();
  }
}
