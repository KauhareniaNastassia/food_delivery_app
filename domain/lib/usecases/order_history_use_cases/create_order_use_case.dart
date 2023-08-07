import 'package:domain/domain.dart';

class CreateOrderUseCase
    implements FutureUseCase<OrderItemModel, void> {
  final OrderHistoryRepository _orderHistoryRepository;

  CreateOrderUseCase({
    required OrderHistoryRepository orderHistoryRepository,
  }) : _orderHistoryRepository = orderHistoryRepository;

  @override
  Future<void> execute(OrderItemModel orderItem) async {
    return _orderHistoryRepository.createOrderItem(orderItem);
  }
}
