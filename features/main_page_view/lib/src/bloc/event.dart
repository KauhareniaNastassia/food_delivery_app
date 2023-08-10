part of 'bloc.dart';

abstract class MenuEvent {}

class InitEvent extends MenuEvent {}

class LoadMenuEvent extends MenuEvent {}

class IsInternetConnectionAvailableEvent extends MenuEvent {}

class FilterMenuByCategoryEvent extends MenuEvent {
  final String category;

  FilterMenuByCategoryEvent({
    required this.category,
  });
}

class NavigateBackEvent extends MenuEvent {
  NavigateBackEvent();
}

class NavigateToMenuItemEvent extends MenuEvent {
  final MenuItemModel menuItem;

  NavigateToMenuItemEvent({
    required this.menuItem,
  });
}
