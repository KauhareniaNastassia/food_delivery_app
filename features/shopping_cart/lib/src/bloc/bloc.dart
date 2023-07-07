import 'package:core/core.dart';
import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:domain/models/shopping_cart_model/shopping_cart_item_model.dart';
import 'package:domain/models/shopping_cart_model/shopping_cart_model.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:domain/usecases/fetch_shopping_cart_items_use_case.dart';

part 'event.dart';

part 'state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final FetchShoppingCartItemsUseCase _fetchShoppingCartItemsUseCase;

  ShoppingCartBloc(
      {required FetchShoppingCartItemsUseCase fetchShoppingCartItemsUseCase})
      : _fetchShoppingCartItemsUseCase = fetchShoppingCartItemsUseCase,
        super(InitShoppingCartState()) {
    on<GetShoppingCartEvent>(_onLoadShoppingCart);
    //on<CalculateTotalEvent>(_calculateTotal);

    add(GetShoppingCartEvent());
  }

  Future<void> _onLoadShoppingCart(
    GetShoppingCartEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    emit(ShoppingCartLoadingState());
    final List<MenuItemModel> shoppingCartItems =
        await _fetchShoppingCartItemsUseCase.execute(const NoParams());
    emit(ShoppingCartLoadedState(shoppingCartItems: shoppingCartItems));
  }

  Future<void> _addItemToShoppingCart(
    AddShoppingCartItemEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    emit(ShoppingCartLoadingState());

    final List<MenuItemModel> shoppingCartItems =
        await _fetchShoppingCartItemsUseCase.execute(const NoParams());
    emit(ShoppingCartLoadedState(shoppingCartItems: shoppingCartItems));
  }

/*Future<double> _calculateTotal(
    CalculateTotalEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    double total = 0.0;

    if (state is! ShoppingCartLoadedState) {
      return total;
    }



    emit(CartTotalState(total: total));

     }*/
}
