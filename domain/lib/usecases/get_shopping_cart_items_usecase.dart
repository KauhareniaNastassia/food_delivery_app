import 'dart:async';

import 'package:domain/domain.dart';

class GetShoppingCartUseCase
    implements FutureUseCase<NoParams, List<ShoppingCartItemModel>> {
  final ShoppingCartRepository _shoppingCartRepository;

  const GetShoppingCartUseCase({
    required ShoppingCartRepository shoppingCartRepository
  }) : _shoppingCartRepository = shoppingCartRepository;

  @override
  Future<List<ShoppingCartItemModel>> execute(NoParams input) async {
    return _shoppingCartRepository.getShoppingCartItems();
  }
}
