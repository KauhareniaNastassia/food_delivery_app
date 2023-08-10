import 'dart:async';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

export 'package:core/core.dart';

class MenuRepositoryImpl implements MenuRepository {
  final FirebaseFireStoreProvider _firebaseFireStoreProvider;
  final HiveProvider _hiveProvider;

  MenuRepositoryImpl({
    required FirebaseFireStoreProvider firebaseFireStoreProvider,
    required HiveProvider hiveProvider,
  })  : _firebaseFireStoreProvider = firebaseFireStoreProvider,
        _hiveProvider = hiveProvider;

  @override
  Future<List<MenuItemModel>> fetchMenuItems() async {
    final bool isInternetConnectionAvailable =
        await CheckInternetConnection.checkIsInternetConnectionAvailable();

    if (isInternetConnectionAvailable) {
      final List<MenuItemEntity> menuItemsFromDB =
          await _firebaseFireStoreProvider.fetchMenuItems();
      await _hiveProvider.saveMenuItemsToLocal(menuItemsFromDB);
      final List<MenuItemModel> menuItems = menuItemsFromDB
          .map(
            (MenuItemEntity e) => MenuItemMapper.toModel(e),
          )
          .toList();
      return menuItems;
    } else {
      final List<MenuItemEntity> menuItems =
          await _hiveProvider.getMenuItemsFromLocal();
      return menuItems
          .map(
            (MenuItemEntity e) => MenuItemMapper.toModel(e),
          )
          .toList();
    }
  }
}
