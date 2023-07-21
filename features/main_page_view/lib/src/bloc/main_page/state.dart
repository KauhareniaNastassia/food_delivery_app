part of 'bloc.dart';

class MenuState {
  final List<MenuItemModel> menu;
  final String? exception;
  final bool isInternetConnectionAvailableState;
  final bool isLoading;

  MenuState({
    this.menu = const [],
    this.exception,
    this.isInternetConnectionAvailableState = true,
    this.isLoading = true,
  });

  MenuState copyWith({
    List<MenuItemModel>? menu,
    String? exception,
    bool? isInternetConnectionAvailableState,
    bool? isLoading,
  }) {
    return MenuState(
      menu: menu ?? this.menu,
      exception: exception ?? this.exception,
      isInternetConnectionAvailableState: isInternetConnectionAvailableState ??
          this.isInternetConnectionAvailableState,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
