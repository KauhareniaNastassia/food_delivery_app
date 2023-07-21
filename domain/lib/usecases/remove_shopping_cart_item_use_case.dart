import 'package:domain/domain.dart';

class RemoveShoppingCartItemUseCase {
  final ShoppingCartRepository _shoppingCartRepository;

  const RemoveShoppingCartItemUseCase({
    required ShoppingCartRepository shoppingCartRepository
  }) : _shoppingCartRepository = shoppingCartRepository;

  Future<void> removeShoppingCartItem(
    ShoppingCartItemModel shoppingCartItemModel,
  ) async {
    return _shoppingCartRepository
        .removeShoppingCartItem(shoppingCartItemModel);
  }
}
