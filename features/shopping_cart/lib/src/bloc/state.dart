part of 'bloc.dart';

class ShoppingCartState {
  final ShoppingCartModel shoppingCart;
  final Object? exception;

  const ShoppingCartState({
    required this.shoppingCart,
    this.exception,
  });

  const ShoppingCartState.empty({
    this.shoppingCart = const ShoppingCartModel(
      shoppingCartItems: [],
      totalPrice: 0.0,
      addCutlery: false,
    ),
    this.exception,
  });

  ShoppingCartState copyWith({
    ShoppingCartModel? shoppingCart,
    Object? exception,
  }) {
    return ShoppingCartState(
      shoppingCart: shoppingCart ?? this.shoppingCart,
      exception: exception ?? this.exception,
    );
  }
}
