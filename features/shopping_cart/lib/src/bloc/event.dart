part of 'bloc.dart';

abstract class ShoppingCartEvent {}

class InitShoppingCartEvent extends ShoppingCartEvent {}

class AddShoppingCartItemEvent extends ShoppingCartEvent {
  final MenuItemModel menuItem;

  AddShoppingCartItemEvent({required this.menuItem});
}

class RemoveShoppingCartItemEvent extends ShoppingCartEvent {
  final MenuItemModel shoppingCartItem;

  RemoveShoppingCartItemEvent({required this.shoppingCartItem});
}

class AddCutleryEvent extends ShoppingCartEvent {
  AddCutleryEvent();
}
