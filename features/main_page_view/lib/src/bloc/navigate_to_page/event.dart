part of 'bloc.dart';

abstract class NavigateToPageEvent {}

class NavigateBackEvent extends NavigateToPageEvent {
  NavigateBackEvent();
}

class NavigateToMenuItemEvent extends NavigateToPageEvent {
  final MenuItemModel menuItem;

  NavigateToMenuItemEvent({
    required this.menuItem,
  });
}

class NavigateToMainPageEvent extends NavigateToPageEvent {
  NavigateToMainPageEvent();
}

class NavigateToSignInPageEvent extends NavigateToPageEvent {
  NavigateToSignInPageEvent();
}

class NavigateToShoppingCartPageEvent extends NavigateToPageEvent {
  NavigateToShoppingCartPageEvent();
}
