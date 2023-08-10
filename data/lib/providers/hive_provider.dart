import 'package:data/data.dart';

class HiveProvider {
  ///menu
  Future<void> saveMenuItemsToLocal(List<MenuItemEntity> menuItems) async {
    final Box<MenuItemEntity> menuItemsBox = await Hive.openBox('menuItems');
    await menuItemsBox.addAll(menuItems);
  }

  Future<List<MenuItemEntity>> getMenuItemsFromLocal() async {
    final Box<MenuItemEntity> menuItemsBox = await Hive.openBox('menuItems');
    final List<MenuItemEntity> menuItemsEntity = menuItemsBox.values.toList();
    return menuItemsEntity;
  }

  ///shopping cart
  Future<List<ShoppingCartItemEntity>> getShoppingCartItemsFromLocal(
      String userId) async {
    final Box<ShoppingCartItemEntity> shoppingCartItemsBox =
        await Hive.openBox(userId);
    return shoppingCartItemsBox.values.toList();
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

  ///settings
  Future<bool> getThemeFromLocal() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    final Box theme = await Hive.openBox('theme');
    return theme.isEmpty ? true : theme.get('isLight').toString() == 'true';
  }

  Future<void> setThemeToLocal(bool isLight) async {
    final Box theme = await Hive.openBox('theme');
    theme.put(
      'isLight',
      isLight.toString(),
    );
  }

  Future<bool> getColorSchemeFromLocal() async {
    final Box colorScheme = await Hive.openBox('colorScheme');
    return colorScheme.isEmpty
        ? true
        : colorScheme.get('colorScheme').toString() == 'true';
  }

  Future<void> setColorSchemeToLocal(bool isStandard) async {
    final Box colorScheme = await Hive.openBox('colorScheme');
    colorScheme.put(
      'colorScheme',
      isStandard.toString(),
    );
  }

  Future<double> getFontSizeFromLocal() async {
    final Box colorScheme = await Hive.openBox('fontSize');
    if (colorScheme.isEmpty) {
      return 1.0;
    } else {
      final String fontSize = colorScheme.get('fontSize').toString();
      return double.parse(fontSize);
    }
  }

  Future<void> setFontSizeToLocal(double fontSize) async {
    final Box colorScheme = await Hive.openBox('fontSize');
    colorScheme.put(
      'fontSize',
      fontSize.toString(),
    );
  }

  ///auth
  Future<String> getUserIdFromLocal() async {
    final Box<UserInfoEntity> userInfoBox = await Hive.openBox('userInfo');
    final UserInfoEntity userInfoEntity = userInfoBox.values.first;
    return userInfoEntity.userId;
  }

  Future<void> setUserToLocal(UserInfoEntity userInfo) async {
    final Box<UserInfoEntity> userInfoBox = await Hive.openBox('userInfo');
    await userInfoBox.add(userInfo);
  }

  Future<UserInfoEntity> checkIsUserInLocal() async {
    final Box<UserInfoEntity> userInfoBox = await Hive.openBox('userInfo');

    if (userInfoBox.isEmpty) {
      return UserInfoEntity(
        userName: '',
        email: '',
        userId: '',
      );
    } else {
      return userInfoBox.values.first;
    }
  }

  Future<void> removeUserFromLocal() async {
    final Box<UserInfoEntity> userInfoBox = await Hive.openBox('userInfo');
    await userInfoBox.clear();
  }
}
