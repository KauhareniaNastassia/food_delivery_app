part of 'bloc.dart';

abstract class MenuState {}

class EmptyState extends MenuState {}

class MenuLoadingState extends MenuState {}

class MenuLoadedState extends MenuState {
  final List<MenuItemModel> menu;

  MenuLoadedState({required this.menu});
}

class MenuErrorState extends MenuState {
  final String errorMessage;

  MenuErrorState({required this.errorMessage});
}
