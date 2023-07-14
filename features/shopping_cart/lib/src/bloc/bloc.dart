import 'package:core/core.dart';
import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:domain/models/shopping_cart_model/shopping_cart_item_model.dart';
import 'package:domain/models/shopping_cart_model/shopping_cart_model.dart';

part 'event.dart';

part 'state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc() : super(const ShoppingCartState.empty()) {
    on<AddShoppingCartItemEvent>(_onAddItemToShoppingCart);
    on<RemoveShoppingCartItemEvent>(_onRemoveItemToShoppingCart);
    on<AddCutleryEvent>(_addCutleryEvent);
  }

  Future<void> _onAddItemToShoppingCart(
    AddShoppingCartItemEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    try {
      final List<ShoppingCartItemModel> shoppingCartItems =
          List.from(state.shoppingCart.shoppingCartItems);
      bool itemIsInCart = false;
      int i = 0;

      while (i < shoppingCartItems.length && !itemIsInCart) {
        if (shoppingCartItems[i].menuItem == event.menuItem) {
          shoppingCartItems[i].amount++;
          itemIsInCart = true;
        }
        i++;
      }

      if (!itemIsInCart) {
        shoppingCartItems.add(
          ShoppingCartItemModel(
            menuItem: event.menuItem,
            amount: 1,
          ),
        );
      }

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
      final List<ShoppingCartItemModel> shoppingCartItems =
          List.from(state.shoppingCart.shoppingCartItems);

      event.shoppingCartItem.amount > 1
          ? event.shoppingCartItem.amount--
          : shoppingCartItems.remove(event.shoppingCartItem);

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
