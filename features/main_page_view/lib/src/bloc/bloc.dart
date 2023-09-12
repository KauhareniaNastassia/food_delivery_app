import 'dart:async';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'event.dart';

part 'state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final FetchMenuItemsUseCase _fetchMenuItemsUseCase;
  final AppRouter _appRouter;

  MenuBloc({
    required FetchMenuItemsUseCase fetchMenuItemsUseCase,
    required AppRouter appRouter,
  })  : _fetchMenuItemsUseCase = fetchMenuItemsUseCase,
        _appRouter = appRouter,
        super(
          MenuState.empty(),
        ) {
    on<InitEvent>(_onLoadMenu);
    on<IsInternetConnectionAvailableEvent>(_isInternetConnectionAvailable);
    on<FilterMenuByCategoryEvent>(_filterMenu);
    on<NavigateBackEvent>(_onNavigateBack);
    on<NavigateToMenuItemEvent>(_onNavigateToMenuItem);

    add(InitEvent());

    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        add(
          IsInternetConnectionAvailableEvent(),
        );
      },
    );
  }

  Future<void> _onLoadMenu(
    InitEvent event,
    Emitter<MenuState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final List<MenuItemModel> menu = await _fetchMenuItemsUseCase.execute(
        const NoParams(),
      );

      Set<String> menuItemCategories = {};
      for (int i = 0; i < menu.length; i++) {
        menuItemCategories.add(menu[i].category);
      }

      emit(
        state.copyWith(
          menu: menu,
          menuItemCategories: menuItemCategories.toList(),
          selectedCategory: AppConstants.allFoods,
          filteredMenu: [],
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          exception: e.toString(),
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _isInternetConnectionAvailable(
    IsInternetConnectionAvailableEvent event,
    Emitter<MenuState> emit,
  ) async {
    final bool isInternetConnectionAvailable =
        await CheckInternetConnection.checkIsInternetConnectionAvailable();

    emit(
      state.copyWith(
        isInternetConnectionAvailable: isInternetConnectionAvailable,
      ),
    );
  }

  void _filterMenu(
    FilterMenuByCategoryEvent event,
    Emitter<MenuState> emit,
  ) {
    if (event.category == AppConstants.allFoods) {
      emit(
        state.copyWith(
          filteredMenu: [],
          selectedCategory: AppConstants.allFoods,
        ),
      );
    } else {
      final List<MenuItemModel> filteredMenu = state.menu
          .where((MenuItemModel item) => item.category == event.category)
          .toList();

      emit(
        state.copyWith(
          filteredMenu: filteredMenu,
          selectedCategory: event.category,
        ),
      );
    }
  }

  void _onNavigateBack(
    NavigateBackEvent event,
    Emitter<MenuState> emit,
  ) {
    _appRouter.pop();
  }

  void _onNavigateToMenuItem(
    NavigateToMenuItemEvent event,
    Emitter<MenuState> emit,
  ) {
    _appRouter.navigate(
      MenuItemDetailsScreenRoute(
        menuItem: event.menuItem,
      ),
    );
  }
}
