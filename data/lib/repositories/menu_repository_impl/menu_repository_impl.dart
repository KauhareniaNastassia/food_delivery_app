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
          image:
              'https://avatars.mds.yandex.net/i?id=51f46ae36021cbc11794e97879f16de2_l-5221720-images-thumbs&ref=rim&n=13&w=1080&h=1080',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
                  'eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco '
                  'laboris nisi ut aliquip ex ea commodo consequat. ',
          ingredients: ['blablabla', 'blablabla', 'blablabla'],
        ),
        MenuItemModel(
          id: 1,
          title: 'Pizza',
          cost: 12.99,
          image: '',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
                  'eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco '
                  'laboris nisi ut aliquip ex ea commodo consequat. ',
          ingredients: ['blablabla'],
        ),
        MenuItemModel(
          id: 2,
          title: 'Salad',
          cost: 7.99,
          image: '',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
                  'eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco '
                  'laboris nisi ut aliquip ex ea commodo consequat. ',
          ingredients: ['blablabla'],
        ),
        MenuItemModel(
          id: 3,
          title: 'Chicken',
          cost: 9.69,
          image: '',
          description: 'blablabla',
          ingredients: ['blablabla'],
        ),
        MenuItemModel(
          id: 4,
          title: 'Salmon',
          cost: 17.99,
          image: '',
          description: 'blablabla',
          ingredients: ['blablabla'],
        ),
        MenuItemModel(
          id: 5,
          title: 'Cheesecake',
          cost: 3.49,
          image: '',
          description: 'blablabla',
          ingredients: ['blablabla'],
        ),
        MenuItemModel(
          id: 6,
          title: 'Salad',
          cost: 7.99,
          image: '',
          description: 'blablabla',
          ingredients: ['blablabla'],
        ),
      ];
      return menu;
    } catch (e) {
      throw ();
    }

    //return result.map((MenuItemEntity) => MenuItemMapper.toModel(MenuItemEntity)).toList();
  }
}
