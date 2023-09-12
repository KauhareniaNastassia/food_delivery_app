part of 'bloc.dart';

class MenuState {
  final List<MenuItemModel> menu;
  final List<MenuItemModel> filteredMenu;
  final List<String> menuItemCategories;
  final String selectedCategory;
  final String exception;
  final bool isInternetConnectionAvailable;
  final bool isLoading;

  MenuState({
    required this.menu,
    required this.filteredMenu,
    required this.menuItemCategories,
    required this.exception,
    required this.isInternetConnectionAvailable,
    required this.selectedCategory,
    required this.isLoading,
  });

  MenuState.empty({
    this.menu = const [],
    this.filteredMenu = const [],
    this.menuItemCategories = const [],
    this.exception = '',
    this.isInternetConnectionAvailable = true,
    this.selectedCategory = 'All foods',
    this.isLoading = true,
  });

  MenuState copyWith({
    List<MenuItemModel>? menu,
    List<MenuItemModel>? filteredMenu,
    List<String>? menuItemCategories,
    String? exception,
    bool? isInternetConnectionAvailable,
    String? selectedCategory,
    bool? isLoading,
  }) {
    return MenuState(
      menu: menu ?? this.menu,
      filteredMenu: filteredMenu ?? this.filteredMenu,
      menuItemCategories: menuItemCategories ?? this.menuItemCategories,
      exception: exception ?? this.exception,
      isInternetConnectionAvailable:
          isInternetConnectionAvailable ?? this.isInternetConnectionAvailable,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
