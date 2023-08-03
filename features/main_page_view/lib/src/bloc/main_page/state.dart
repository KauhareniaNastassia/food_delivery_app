part of 'bloc.dart';

class MenuState {
  final List<MenuItemModel> menu;
  final String? exception;
  final bool isInternetConnectionAvailable;
  final bool isLoading;

  MenuState({
    this.menu = const [],
    this.exception,
    this.isInternetConnectionAvailable = true,
    this.isLoading = true,
  });

  MenuState copyWith({
    List<MenuItemModel>? menu,
    String? exception,
    bool? isInternetConnectionAvailable,
    bool? isLoading,
  }) {
    return MenuState(
      menu: menu ?? this.menu,
      exception: exception ?? this.exception,
      isInternetConnectionAvailable: isInternetConnectionAvailable ??
          this.isInternetConnectionAvailable,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
