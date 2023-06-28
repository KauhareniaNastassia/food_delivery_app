import 'package:bloc/bloc.dart';
import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:domain/usecases/fetch_menu_items_usecase.dart';
import 'package:domain/usecases/usecase.dart';

part 'event.dart';
part 'state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final FetchMenuItemsUseCase _fetchMenuItemsUseCase;
  late List<MenuItemModel> menu = <MenuItemModel>[];

  MenuBloc({required FetchMenuItemsUseCase fetchMenuItemsUseCase})
      : _fetchMenuItemsUseCase = fetchMenuItemsUseCase,
        super(EmptyState()) {
    on<InitEvent>(_initMenu);
  }

  void _initMenu(InitEvent event, Emitter<MenuState> emit) {
    _loadMenu();
  }

  Future<void> _loadMenu() async {
    emit(MenuLoadingState());
    try {
      menu = await _fetchMenuItemsUseCase.execute(const NoParams());
      emit(MenuLoadedState(menu: menu));
    } catch (e, _) {
      emit(MenuErrorState(errorMessage: e.toString()));
    }
  }
}

//new

/*
MainPageBloc(
{required FetchMenuItemsUseCase fetchMenuItemsUseCase}
) : _fetchMenuItemsUseCase = fetchMenuItemsUseCase,
super(EmptyState()) {
try{
on<InitEvent>(_init);
}
catch (e) {
print('Exception during MainPageBloc initialization: $e');
}
}*/
