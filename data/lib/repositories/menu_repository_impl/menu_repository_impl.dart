import 'dart:async';

import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:domain/repositories/menu_repository.dart';

class MenuRepositoryImpl implements MenuRepository {
  MenuRepositoryImpl() : super();

  @override
  Future<List<MenuItemModel>> fetchMenuItems() async {
    try {
      List<MenuItemModel> menu = [
        MenuItemModel(
          id: 0,
          title: 'Burger',
          cost: 9.99,
          image: '',
        ),
        MenuItemModel(
          id: 1,
          title: 'Pizza',
          cost: 12.99,
          image: '',
        ),
        MenuItemModel(
          id: 2,
          title: 'Salad',
          cost: 7.99,
          image: '',
        ),
        MenuItemModel(
          id: 3,
          title: 'Chicken',
          cost: 9.69,
          image: '',
        ),
        MenuItemModel(
          id: 4,
          title: 'Salmon',
          cost: 17.99,
          image: '',
        ),
        MenuItemModel(
          id: 5,
          title: 'Cheesecake',
          cost: 3.49,
          image: '',
        ),
        MenuItemModel(
          id: 6,
          title: 'Salad',
          cost: 7.99,
          image: '',
        ),
      ];
      return menu;
    } catch (e) {
      throw ();
    }

    //return result.map((MenuItemEntity) => MenuItemMapper.toModel(MenuItemEntity)).toList();
  }
}
