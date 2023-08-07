import 'package:domain/domain.dart';

class ClearShoppingCartUseCase {
  final ShoppingCartRepository _shoppingCartRepository;

  const ClearShoppingCartUseCase({
    required ShoppingCartRepository shoppingCartRepository,
  }) : _shoppingCartRepository = shoppingCartRepository;

  Future<void> execute(NoParams input) async {
    return _shoppingCartRepository.clearShoppingCart();
  }
}
