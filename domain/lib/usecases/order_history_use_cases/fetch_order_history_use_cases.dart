import 'package:domain/domain.dart';

class FetchOrderHistoryUseCase
    implements FutureUseCase<String, List<OrderItemModel>> {
  final OrderHistoryRepository _orderHistoryRepository;

  FetchOrderHistoryUseCase({
    required OrderHistoryRepository orderHistoryRepository,
  }) : _orderHistoryRepository = orderHistoryRepository;

  @override
  Future<List<OrderItemModel>> execute(String userId) async {
    return _orderHistoryRepository.fetchOrderHistory(userId);
  }
}
