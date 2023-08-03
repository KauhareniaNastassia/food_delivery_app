import 'package:data/data.dart';
import 'package:domain/domain.dart';

class LocalMenuProvider {
  const LocalMenuProvider();

  Future<void> saveMenuItemsToLocal(List<MenuItemModel> menuItems) async {
    final Box<MenuItemEntity> menuItemsBox = await Hive.openBox('menuItems');
    final List<MenuItemEntity> menuItemsEntity = menuItems
        .map(
          (MenuItemModel menuItem) => MenuItemMapper.toEntity(menuItem),
        )
        .toList();
    await menuItemsBox.addAll(menuItemsEntity);
  }

  Future<List<MenuItemEntity>> getMenuItemsFromLocal() async {
    final Box<MenuItemEntity> menuItemsBox = await Hive.openBox('menuItems');
    final List<MenuItemEntity> menuItemsEntity = menuItemsBox.values.toList();
    return menuItemsEntity;
  }
}
