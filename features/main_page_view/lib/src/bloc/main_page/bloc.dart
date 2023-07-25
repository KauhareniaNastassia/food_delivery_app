import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'event.dart';
part 'state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final FetchMenuItemsUseCase _fetchMenuItemsUseCase;

  MenuBloc({
    required FetchMenuItemsUseCase fetchMenuItemsUseCase,
  })  : _fetchMenuItemsUseCase = fetchMenuItemsUseCase,
        super(MenuState()) {
    on<InitEvent>(_onLoadMenu);
    on<IsInternetConnectionAvailableEvent>(_isInternetConnectionAvailable);

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
    add(IsInternetConnectionAvailableEvent());
    emit(state.copyWith(isLoading: true));

    try {
      final List<MenuItemModel> menu = await _fetchMenuItemsUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          menu: menu,
          isLoading: false,
        ),
      );
    } catch (e, _) {
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
}
