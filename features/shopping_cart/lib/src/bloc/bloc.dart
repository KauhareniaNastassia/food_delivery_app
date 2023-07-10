import 'dart:developer';

import 'package:core/core.dart';
import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:domain/models/shopping_cart_model/shopping_cart_item_model.dart';
import 'package:domain/models/shopping_cart_model/shopping_cart_model.dart';

part 'event.dart';

part 'state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc() : super(const ShoppingCartState()) {
    on<AddShoppingCartItemEvent>(_onAddItemToShoppingCart);
    on<RemoveShoppingCartItemEvent>(_onRemoveItemToShoppingCart);
    on<AddCutleryEvent>(_addCutleryEvent);
  }

  _onAddItemToShoppingCart(
    AddShoppingCartItemEvent event,
    Emitter<ShoppingCartState> emit,
  ) {
    final List<ShoppingCartItemModel> shoppingCartItems =
        List.from(state.shoppingCart.shoppingCartItems);

    bool itemIsInCart = false;

    for (int i = 0; i < shoppingCartItems.length; i++) {
      if (shoppingCartItems[i].menuItem == event.menuItem) {
        shoppingCartItems[i].amount++;
        itemIsInCart = true;
      }
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
        shoppingCart: ShoppingCartModel(
          shoppingCartItems: shoppingCartItems,
          totalPrice: state.shoppingCart.totalPrice + event.menuItem.cost,
          addCutlery: state.shoppingCart.addCutlery,
        ),
      ),
    );
  }

  _onRemoveItemToShoppingCart(
    RemoveShoppingCartItemEvent event,
    Emitter<ShoppingCartState> emit,
  ) {
    final List<ShoppingCartItemModel> shoppingCartItems =
        List.from(state.shoppingCart.shoppingCartItems);

    for (int i = 0; i < shoppingCartItems.length; i++) {
      if (shoppingCartItems[i].menuItem == event.shoppingCartItem) {
        shoppingCartItems[i].amount > 1
            ? shoppingCartItems[i].amount--
            : shoppingCartItems.removeAt(i);
      }
    }

    emit(
      state.copyWith(
        shoppingCart: ShoppingCartModel(
          shoppingCartItems: shoppingCartItems,
          totalPrice:
              state.shoppingCart.totalPrice - event.shoppingCartItem.cost,
          addCutlery: state.shoppingCart.addCutlery,
        ),
      ),
    );
  }

  _addCutleryEvent(
    AddCutleryEvent event,
    Emitter<ShoppingCartState> emit,
  ) {
    final newAddCutlery = !state.shoppingCart.addCutlery;
    emit(
      state.copyWith(
        shoppingCart: state.shoppingCart.copyWith(
          addCutlery: newAddCutlery,
          totalPrice: newAddCutlery
              ? state.shoppingCart.totalPrice + 2
              : state.shoppingCart.totalPrice - 2,
        ),
      ),
    );
  }
}
