import 'package:domain/usecases/usecase.dart';

import '../models/menu_item_model/menu_item_model.dart';
import '../models/shopping_cart_model/shopping_cart_item_model.dart';
import '../repositories/shopping_cart_repository.dart';

class FetchShoppingCartItemsUseCase
    implements FutureUseCase<NoParams, List<MenuItemModel>> {
  final ShoppingCartRepository _shoppingCartRepository;

  const FetchShoppingCartItemsUseCase(
      {required ShoppingCartRepository shoppingCartRepository})
      : _shoppingCartRepository = shoppingCartRepository;

  @override
  Future<List<MenuItemModel>> execute(NoParams input) async {
    return _shoppingCartRepository.fetchShoppingCartItems();
  }
}
