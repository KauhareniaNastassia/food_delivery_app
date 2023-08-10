import 'package:domain/domain.dart';

class CreateOrderUseCase {
  final OrderHistoryRepository _orderHistoryRepository;

  CreateOrderUseCase({
    required OrderHistoryRepository orderHistoryRepository,
  }) : _orderHistoryRepository = orderHistoryRepository;

  Future<void> execute({
    required String userId,
    required OrderItemModel orderItem,
  }) async {
    return _orderHistoryRepository.createOrderItem(
      userId: userId,
      orderItem: orderItem,
    );
  }
}
