import 'package:data/data.dart';

class LocalShoppingCartProvider {
  LocalShoppingCartProvider();

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
      if (shoppingCartItemsEntity[i].menuItemEntity == menuItemEntity) {
        shoppingCartItemsEntity[i].amount++;

        box.put(shoppingCartItemsEntity[i].menuItemEntity.id,
            shoppingCartItemsEntity[i]);

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
      shoppingCartItemEntity.amount--;

      await box.put(
        shoppingCartItemEntity.menuItemEntity.id,
        shoppingCartItemEntity,
      );
    } else {
      await box.delete(shoppingCartItemEntity.menuItemEntity.id);
    }
  }
}
