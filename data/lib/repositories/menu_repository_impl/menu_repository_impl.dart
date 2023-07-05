import 'dart:async';

import 'package:data/entity/menu_item_entity.dart';
import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:domain/repositories/menu_repository.dart';

import '../../mappers/menu_item_mapper.dart';
import '../../providers/menu_provider.dart';

class MenuRepositoryImpl implements MenuRepository {
  final MenuDataProvider _menuDataProvider;

  MenuRepositoryImpl({required MenuDataProvider menuDataProvider})
      : _menuDataProvider = menuDataProvider;

  @override
  Future<List<MenuItemModel>> fetchMenuItems() async {
    final List<MenuItemEntity> menuItems =
        await _menuDataProvider.fetchMenuItems();
    return menuItems
        .map((MenuItemEntity e) => MenuItemMapper.toModel(e))
        .toList();
  }
}
