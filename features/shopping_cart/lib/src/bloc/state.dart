part of 'bloc.dart';

class ShoppingCartState {
  final ShoppingCartModel shoppingCart;

  const ShoppingCartState({
    this.shoppingCart = const ShoppingCartModel(
      shoppingCartItems: [],
      totalPrice: 0.0,
      addCutlery: false,
    ),
  });

  ShoppingCartState copyWith({
    ShoppingCartModel? shoppingCart,
  }) {
    return ShoppingCartState(
      shoppingCart: shoppingCart ?? this.shoppingCart,
    );
  }
}

class ShoppingCartErrorState extends ShoppingCartState {
  final String errorMessage;

  ShoppingCartErrorState({required this.errorMessage});
}
