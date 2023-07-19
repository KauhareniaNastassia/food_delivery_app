import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'event.dart';
part 'state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final GetShoppingCartUseCase _getShoppingCartUseCase;
  final AddShoppingCartItemUseCase _addShoppingCartItemUseCase;
  final RemoveShoppingCartItemUseCase _removeShoppingCartItemUseCase;

  ShoppingCartBloc({
    required GetShoppingCartUseCase getShoppingCartUseCase,
    required AddShoppingCartItemUseCase addShoppingCartItemUseCase,
    required RemoveShoppingCartItemUseCase removeShoppingCartItemUseCase,
  })  : _getShoppingCartUseCase = getShoppingCartUseCase,
        _addShoppingCartItemUseCase = addShoppingCartItemUseCase,
        _removeShoppingCartItemUseCase = removeShoppingCartItemUseCase,
        super(const ShoppingCartState.empty()) {
    on<InitShoppingCartEvent>(_onGetShoppingCart);
    on<AddShoppingCartItemEvent>(_onAddItemToShoppingCart);
    on<RemoveShoppingCartItemEvent>(_onRemoveItemToShoppingCart);
    on<AddCutleryEvent>(_addCutleryEvent);

    add(
      InitShoppingCartEvent(),
    );
  }

  Future<void> _onGetShoppingCart(
    InitShoppingCartEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    try {
      final List<ShoppingCartItemModel> shoppingCartItems =
          await _getShoppingCartUseCase.execute(
        const NoParams(),
      );

      if (shoppingCartItems.isEmpty) {
        emit(
          state.copyWith(shoppingCart: state.shoppingCart),
        );
      } else {
        double totalPrice = 0.0;
        for (final item in shoppingCartItems) {
          totalPrice += item.menuItem.cost * item.amount;
        }

        emit(
          state.copyWith(
            shoppingCart: state.shoppingCart.copyWith(
              shoppingCartItems: shoppingCartItems,
              totalPrice: totalPrice,
              addCutlery: false,
            ),
          ),
        );
      }
    } catch (e, _) {
      emit(
        state.copyWith(exception: e),
      );
    }
  }

  Future<void> _onAddItemToShoppingCart(
    AddShoppingCartItemEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    try {
      await _addShoppingCartItemUseCase.addShoppingCartItem(event.menuItem);
      final List<ShoppingCartItemModel> shoppingCartItems =
          await _getShoppingCartUseCase.execute(
        const NoParams(),
      );

      emit(
        state.copyWith(
          shoppingCart: state.shoppingCart.copyWith(
            shoppingCartItems: shoppingCartItems,
            totalPrice: state.shoppingCart.totalPrice + event.menuItem.cost,
          ),
        ),
      );
    } catch (e, _) {
      emit(
        state.copyWith(exception: e),
      );
    }
  }

  Future<void> _onRemoveItemToShoppingCart(
    RemoveShoppingCartItemEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    try {
      await _removeShoppingCartItemUseCase
          .removeShoppingCartItem(event.shoppingCartItem);
      final List<ShoppingCartItemModel> shoppingCartItems =
          await _getShoppingCartUseCase.execute(
        const NoParams(),
      );

      emit(
        state.copyWith(
          shoppingCart: state.shoppingCart.copyWith(
            shoppingCartItems: shoppingCartItems,
            totalPrice: state.shoppingCart.totalPrice -
                event.shoppingCartItem.menuItem.cost,
          ),
        ),
      );
    } catch (e, _) {
      emit(
        state.copyWith(exception: e),
      );
    }
  }

  Future<void> _addCutleryEvent(
    AddCutleryEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    try {
      final newAddCutlery = !state.shoppingCart.addCutlery;
      emit(
        state.copyWith(
          shoppingCart: state.shoppingCart.copyWith(
            addCutlery: newAddCutlery,
            totalPrice: newAddCutlery
                ? state.shoppingCart.totalPrice + 0.5
                : state.shoppingCart.totalPrice - 0.5,
          ),
        ),
      );
    } catch (e, _) {
      emit(
        state.copyWith(exception: e),
      );
    }
  }
}
