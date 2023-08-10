part of 'bloc.dart';

class MenuState {
  final List<MenuItemModel> menu;
  final List<MenuItemModel> filteredMenu;
  final String selectedCategory;
  final String exception;
  final bool isInternetConnectionAvailable;
  final bool isLoading;

  MenuState({
    required this.menu,
    required this.filteredMenu,
    required this.exception,
    required this.isInternetConnectionAvailable,
    required this.selectedCategory,
    required this.isLoading,
  });

  MenuState.empty({
    this.menu = const [],
    this.filteredMenu = const [],
    this.exception = '',
    this.isInternetConnectionAvailable = true,
    this.selectedCategory = 'all foods',
    this.isLoading = true,
  });

  MenuState copyWith({
    List<MenuItemModel>? menu,
    List<MenuItemModel>? filteredMenu,
    String? exception,
    bool? isInternetConnectionAvailable,
    String? selectedCategory,
    bool? isLoading,
  }) {
    return MenuState(
      menu: menu ?? this.menu,
      filteredMenu: filteredMenu ?? this.filteredMenu,
      exception: exception ?? this.exception,
      isInternetConnectionAvailable:
          isInternetConnectionAvailable ?? this.isInternetConnectionAvailable,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
