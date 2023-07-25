import 'dart:async';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

export 'package:core/core.dart';

class MenuRepositoryImpl implements MenuRepository {
  final MenuDataProvider _menuDataProvider;
  final LocalMenuProvider _localMenuProvider;

  MenuRepositoryImpl({
    required MenuDataProvider menuDataProvider,
    required LocalMenuProvider localMenuProvider,
  })
      : _menuDataProvider = menuDataProvider,
        _localMenuProvider = localMenuProvider;

  @override
  Future<List<MenuItemModel>> fetchMenuItems() async {
    if (await CheckInternetConnection.checkIsInternetConnectionAvailable()) {
      final List<MenuItemEntity> menuItems =
      await _localMenuProvider.getMenuItemsFromLocal();
      return menuItems
          .map(
            (MenuItemEntity e) => MenuItemMapper.toModel(e),
      )
          .toList();
    } else {
      final List<MenuItemEntity> result =
      await _menuDataProvider.fetchMenuItems();
      final List<MenuItemModel> menuItems = result
          .map(
            (MenuItemEntity e) => MenuItemMapper.toModel(e),
      )
          .toList();
      await _localMenuProvider.saveMenuItemsToLocal(menuItems);
      return menuItems;
    }
  }
}
