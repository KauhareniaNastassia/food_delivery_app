
part of 'bloc.dart';

abstract class ShoppingCartState {
}

class InitShoppingCartState extends ShoppingCartState {}

class CartTotalState extends ShoppingCartState {
  final double total;

  CartTotalState({required this.total});
}

class ShoppingCartLoadingState extends ShoppingCartState {}

class ShoppingCartLoadedState extends ShoppingCartState {
  final List<MenuItemModel> shoppingCartItems;

  ShoppingCartLoadedState({required this.shoppingCartItems});
}

class ShoppingCartErrorState extends ShoppingCartState {
  final String errorMessage;

  ShoppingCartErrorState({required this.errorMessage});
}
