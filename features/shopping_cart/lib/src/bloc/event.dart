part of 'bloc.dart';

abstract class ShoppingCartEvent {}

class GetShoppingCartEvent extends ShoppingCartEvent {}

class CalculateTotalEvent extends ShoppingCartEvent {}

class AddShoppingCartItemEvent extends ShoppingCartEvent {
  final ShoppingCartItemModel shoppingCartItem;

  AddShoppingCartItemEvent({required this.shoppingCartItem});
}

class RemoveShoppingCartItemEvent extends ShoppingCartEvent {
  final ShoppingCartItemModel shoppingCartItem;

  RemoveShoppingCartItemEvent({required this.shoppingCartItem});
}
