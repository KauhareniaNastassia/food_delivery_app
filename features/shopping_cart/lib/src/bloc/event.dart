part of 'bloc.dart';

abstract class ShoppingCartEvent {}

class InitShoppingCartEvent extends ShoppingCartEvent {}

class AddShoppingCartItemEvent extends ShoppingCartEvent {
  final MenuItemModel menuItem;

  AddShoppingCartItemEvent({required this.menuItem});
}

class RemoveShoppingCartItemEvent extends ShoppingCartEvent {
  final ShoppingCartItemModel shoppingCartItem;

  RemoveShoppingCartItemEvent({required this.shoppingCartItem});
}

class AddCutleryEvent extends ShoppingCartEvent {
  AddCutleryEvent();
}

class ClearShoppingCartEvent extends ShoppingCartEvent {
  ClearShoppingCartEvent();
}

class NavigateToMainPageEvent extends ShoppingCartEvent {
  NavigateToMainPageEvent();
}
