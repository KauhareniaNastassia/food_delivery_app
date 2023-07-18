import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

part 'event.dart';
part 'state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final FetchMenuItemsUseCase _fetchMenuItemsUseCase;

  MenuBloc({required FetchMenuItemsUseCase fetchMenuItemsUseCase})
      : _fetchMenuItemsUseCase = fetchMenuItemsUseCase,
        super(EmptyState()) {
    on<InitEvent>(_onLoadMenu);

    add(InitEvent());
  }

  Future<void> _onLoadMenu(
    InitEvent event,
    Emitter<MenuState> emit,
  ) async {
    emit(MenuLoadingState());
    try {
      final List<MenuItemModel> menu = await _fetchMenuItemsUseCase.execute(
        const NoParams(),
      );
      emit(
        MenuLoadedState(menu: menu),
      );
    } catch (e, _) {
      emit(
        MenuErrorState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
