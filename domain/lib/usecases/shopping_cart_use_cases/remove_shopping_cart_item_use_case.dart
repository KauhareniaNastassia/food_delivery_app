import 'package:domain/domain.dart';

class RemoveShoppingCartItemUseCase {
  final ShoppingCartRepository _shoppingCartRepository;

  const RemoveShoppingCartItemUseCase({
    required ShoppingCartRepository shoppingCartRepository,
  }) : _shoppingCartRepository = shoppingCartRepository;

  Future<void> removeShoppingCartItem({
    required String userId,
    required ShoppingCartItemModel shoppingCartItemModel,
  }) async {
    return _shoppingCartRepository.removeShoppingCartItem(
      userId: userId,
      shoppingCartItemModel: shoppingCartItemModel,
    );
  }
}
