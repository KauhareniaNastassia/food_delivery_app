import 'dart:async';
import 'dart:developer';

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

  /*@override
  Future<List<MenuItemModel>> fetchMenuItems() async {
    final bool isInternetConnectionAvailable =
        await CheckInternetConnection.checkIsInternetConnectionAvailable();

    if (isInternetConnectionAvailable) {
      final List<MenuItemEntity> menuItemsFromDB =
          await _firebaseFireStoreProvider.fetchMenuItems();

      log(menuItemsFromDB[0].titles[0].title.toString());

     await _hiveProvider.saveMenuItemsToLocal(menuItemsFromDB);
      final List<MenuItemModel> menuItems = menuItemsFromDB
          .map(
            (MenuItemEntity e) => MenuItemMapper.toModel(e),
          )
          .toList();
      log(menuItems.toString());
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
  }*/

  @override
  Future<List<MenuItemModel>> fetchMenuItems() async {
    try {
      final bool isInternetConnectionAvailable =
      await CheckInternetConnection.checkIsInternetConnectionAvailable();

      if (isInternetConnectionAvailable) {
        final List<MenuItemEntity> menuItemsFromDB =
        await _firebaseFireStoreProvider.fetchMenuItems();

        log(menuItemsFromDB[0].toString());


        await _hiveProvider.saveMenuItemsToLocal(menuItemsFromDB);

        final List<MenuItemModel> menuItems = menuItemsFromDB
            .map(
              (MenuItemEntity e) => MenuItemMapper.toModel(e),
        )
            .toList();
        //log(menuItems.toString());
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
    } catch (e) {
      // Handle the exception here
      log('An error occurred while fetching menu items: $e');
      return []; // Return an empty list or handle the error accordingly
    }
  }

}
