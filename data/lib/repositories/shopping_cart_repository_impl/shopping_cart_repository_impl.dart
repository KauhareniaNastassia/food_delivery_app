import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:domain/models/shopping_cart_model/shopping_cart_item_model.dart';
import 'package:domain/repositories/shopping_cart_repository.dart';
import '../../entity/menu_item_entity.dart';
import '../../mappers/menu_item_mapper.dart';

import '../../entity/shopping_cart_entity/shopping_cart_item_entity.dart';
import '../../providers/shopping_cart_data_provider.dart';

class ShoppingCartRepositoryImpl implements ShoppingCartRepository {
  final ShoppingCartDataProvider _shoppingCartDataProvider;

  ShoppingCartRepositoryImpl(
      {required ShoppingCartDataProvider shoppingCartDataProvider})
      : _shoppingCartDataProvider = shoppingCartDataProvider;

  @override
  Future<List<MenuItemModel>> fetchShoppingCartItems() async {
    final List<MenuItemEntity> shoppingCartItems =
        await _shoppingCartDataProvider.fetchShoppingCartItems();
    return shoppingCartItems
        .map((MenuItemEntity e) => MenuItemMapper.toModel(e))
        .toList();
  }
}
