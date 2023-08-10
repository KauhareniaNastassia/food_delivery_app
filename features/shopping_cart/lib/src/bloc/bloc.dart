import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'event.dart';
part 'state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final GetShoppingCartUseCase _getShoppingCartUseCase;
  final AddShoppingCartItemUseCase _addShoppingCartItemUseCase;
  final RemoveShoppingCartItemUseCase _removeShoppingCartItemUseCase;
  final ClearShoppingCartUseCase _clearShoppingCartUseCase;
  final GetUserIdUseCase _getUserIdUseCase;
  final AppRouter _appRouter;

  ShoppingCartBloc({
    required GetShoppingCartUseCase getShoppingCartUseCase,
    required AddShoppingCartItemUseCase addShoppingCartItemUseCase,
    required RemoveShoppingCartItemUseCase removeShoppingCartItemUseCase,
    required ClearShoppingCartUseCase clearShoppingCartUseCase,
    required GetUserIdUseCase getUserIdUseCase,
    required AppRouter appRouter,
  })  : _getShoppingCartUseCase = getShoppingCartUseCase,
        _addShoppingCartItemUseCase = addShoppingCartItemUseCase,
        _removeShoppingCartItemUseCase = removeShoppingCartItemUseCase,
        _clearShoppingCartUseCase = clearShoppingCartUseCase,
        _getUserIdUseCase = getUserIdUseCase,
        _appRouter = appRouter,
        super(
          const ShoppingCartState.empty(),
        ) {
    on<InitShoppingCartEvent>(_onGetShoppingCart);
    on<AddShoppingCartItemEvent>(_onAddItemToShoppingCart);
    on<RemoveShoppingCartItemEvent>(_onRemoveItemToShoppingCart);
    on<AddCutleryEvent>(_addCutleryEvent);
    on<ClearShoppingCartEvent>(_clearShoppingCart);
    on<NavigateToMainPageEvent>(_onNavigateToMainPage);

    add(
      InitShoppingCartEvent(),
    );
  }

  Future<void> _onGetShoppingCart(
    InitShoppingCartEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    emit(
      const ShoppingCartState.empty(),
    );

    try {
      final String userId = await _getUserIdUseCase.execute(
        const NoParams(),
      );

      final List<ShoppingCartItemModel> shoppingCartItems =
          await _getShoppingCartUseCase.execute(userId);

      if (shoppingCartItems.isEmpty) {
        emit(
          state.copyWith(
            userId: userId,
          ),
        );
      } else {
        double totalPrice = 0.0;
        for (final ShoppingCartItemModel item in shoppingCartItems) {
          totalPrice += item.menuItem.cost * item.amount;
        }

        emit(
          state.copyWith(
            shoppingCart: state.shoppingCart.copyWith(
              shoppingCartItems: shoppingCartItems,
              totalPrice: totalPrice,
            ),
            userId: userId,
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
    emit(
      state.copyWith(exception: ''),
    );
    try {
      await _addShoppingCartItemUseCase.addShoppingCartItem(
        userId: state.userId,
        menuItemModel: event.menuItem,
      );
      final List<ShoppingCartItemModel> shoppingCartItems =
          await _getShoppingCartUseCase.execute(
        state.userId,
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
    emit(
      state.copyWith(exception: ''),
    );
    try {
      await _removeShoppingCartItemUseCase.removeShoppingCartItem(
        userId: state.userId,
        shoppingCartItemModel: event.shoppingCartItem,
      );
      final List<ShoppingCartItemModel> shoppingCartItems =
          await _getShoppingCartUseCase.execute(state.userId);

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
    emit(
      state.copyWith(exception: ''),
    );
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

  Future<void> _clearShoppingCart(
    ClearShoppingCartEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    emit(
      state.copyWith(exception: ''),
    );
    try {
      await _clearShoppingCartUseCase.execute(state.userId);
      emit(
        state.copyWith(
          shoppingCart: state.shoppingCart.copyWith(
            shoppingCartItems: [],
            totalPrice: 0.0,
            addCutlery: false,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(exception: e),
      );
    }
  }

  void _onNavigateToMainPage(
    NavigateToMainPageEvent event,
    Emitter<ShoppingCartState> emit,
  ) {
    _appRouter.navigate(
      const MainPageRoute(
        children: <PageRouteInfo<dynamic>>[
          MainPageScreenRoute(),
        ],
      ),
    );
  }
}
