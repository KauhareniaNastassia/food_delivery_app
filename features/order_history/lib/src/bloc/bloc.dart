import 'package:core/core.dart';
import 'package:order_history/order_history.dart';
export 'package:auth/auth.dart';
export 'package:domain/domain.dart';

part 'event.dart';

part 'state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  final FetchOrderHistoryUseCase _fetchOrderHistoryUseCase;
  final GetUserIdUseCase _getUserIdUseCase;
  final CreateOrderUseCase _createOrderUseCase;

  OrderHistoryBloc({
    required GetUserIdUseCase getUserIdUseCase,
    required FetchOrderHistoryUseCase fetchOrderHistoryUseCase,
    required CreateOrderUseCase createOrderUseCase,
  })  : _getUserIdUseCase = getUserIdUseCase,
        _fetchOrderHistoryUseCase = fetchOrderHistoryUseCase,
        _createOrderUseCase = createOrderUseCase,
        super(OrderHistoryState.empty()) {
    on<InitOrderHistoryEvent>(_initOrderHistory);
    on<CreateOrderEvent>(_createOrder);

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
      await _createOrderUseCase.execute(state.userId, event.orderItem);
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
}
