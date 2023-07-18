import 'package:domain/domain.dart';

class AddShoppingCartItemUseCase {
  final ShoppingCartRepository _shoppingCartRepository;

  const AddShoppingCartItemUseCase(
      {required ShoppingCartRepository shoppingCartRepository})
      : _shoppingCartRepository = shoppingCartRepository;

  Future<void> addShoppingCartItem(MenuItemModel menuItemModel) async {
    return _shoppingCartRepository.addShoppingCartItem(menuItemModel);
  }
}
