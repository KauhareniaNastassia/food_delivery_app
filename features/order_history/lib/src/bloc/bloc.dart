import 'package:core/core.dart';
import 'package:order_history/order_history.dart';
export 'package:auth/auth.dart';
export 'package:domain/domain.dart';
export 'package:navigation/navigation.dart';

part 'event.dart';

part 'state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  final FetchOrderHistoryUseCase _fetchOrderHistoryUseCase;
  final GetUserIdUseCase _getUserIdUseCase;
  final CreateOrderUseCase _createOrderUseCase;
  final AppRouter _appRouter;

  OrderHistoryBloc({
    required GetUserIdUseCase getUserIdUseCase,
    required FetchOrderHistoryUseCase fetchOrderHistoryUseCase,
    required AppRouter appRouter,
    required CreateOrderUseCase createOrderUseCase,
  })  : _getUserIdUseCase = getUserIdUseCase,
        _fetchOrderHistoryUseCase = fetchOrderHistoryUseCase,
        _createOrderUseCase = createOrderUseCase,
        _appRouter = appRouter,
        super(
          OrderHistoryState.empty(),
        ) {
    on<InitOrderHistoryEvent>(_initOrderHistory);
    on<CreateOrderEvent>(_createOrder);
    on<NavigateToShoppingCartPageEvent>(_onNavigateToShoppingCartPage);

    add(
      InitOrderHistoryEvent(),
    );
  }

  Future<void> _initOrderHistory(
    InitOrderHistoryEvent event,
    Emitter<OrderHistoryState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        exception: '',
        orderItems: [],
        userId: '',
      ),
    );
    try {
      final String userId = await _getUserIdUseCase.execute(
        const NoParams(),
      );
      final List<OrderItemModel> orderHistory =
          await _fetchOrderHistoryUseCase.execute(userId);
      orderHistory.isEmpty
          ? emit(
              state.copyWith(
                orderItems: [],
                isLoading: false,
                userId: userId,
              ),
            )
          : emit(
              state.copyWith(
                orderItems: orderHistory,
                isLoading: false,
                userId: userId,
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

  Future<void> _createOrder(
    CreateOrderEvent event,
    Emitter<OrderHistoryState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        exception: '',
      ),
    );
    try {
      await _createOrderUseCase.execute(
        userId: state.userId,
        orderItem: event.orderItem,
      );
      emit(
        state.copyWith(
          orderItems: [event.orderItem, ...state.orderItems],
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

  void _onNavigateToShoppingCartPage(
    NavigateToShoppingCartPageEvent event,
    Emitter<OrderHistoryState> emit,
  ) {
    _appRouter.navigate(
      const MainPageRoute(
        children: <PageRouteInfo<dynamic>>[
          ShoppingCartPageScreenRoute(),
        ],
      ),
    );
  }
}
