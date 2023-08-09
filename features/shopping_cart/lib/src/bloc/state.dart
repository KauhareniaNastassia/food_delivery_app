part of 'bloc.dart';

class ShoppingCartState {
  final ShoppingCartModel shoppingCart;
  final Object? exception;
  final String userId;

  const ShoppingCartState({
    required this.shoppingCart,
    required this.userId,
    this.exception,
  });

  const ShoppingCartState.empty({
    this.shoppingCart = const ShoppingCartModel(
      shoppingCartItems: [],
      totalPrice: 0.0,
      addCutlery: false,
    ),
    this.exception,
    this.userId = '',
  });

  ShoppingCartState copyWith({
    ShoppingCartModel? shoppingCart,
    Object? exception,
    String? userId,
  }) {
    return ShoppingCartState(
      shoppingCart: shoppingCart ?? this.shoppingCart,
      exception: exception ?? this.exception,
      userId: userId ?? this.userId,
    );
  }
}
