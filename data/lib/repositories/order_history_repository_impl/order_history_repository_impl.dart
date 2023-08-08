import 'package:data/data.dart';
import 'package:domain/domain.dart';

class OrderHistoryRepositoryImpl implements OrderHistoryRepository {
  final OrderHistoryProvider _orderHistoryProvider;

  const OrderHistoryRepositoryImpl({
    required OrderHistoryProvider orderHistoryProvider,
  }) : _orderHistoryProvider = orderHistoryProvider;

  @override
  Future<List<OrderItemModel>> fetchOrderHistory(String userId) async {
    final List<OrderItemEntity> result =
        await _orderHistoryProvider.fetchOrderHistory(userId);

    final List<OrderItemModel> orderItems = result
        .map(
          (OrderItemEntity e) => OrderItemMapper.toModel(e),
        )
        .toList();
    return orderItems;
  }

  @override
  Future<void> createOrderItem(
    String userId,
    OrderItemModel orderItem,
  ) async {
    final OrderItemEntity orderItemEntity = OrderItemMapper.toEntity(orderItem);
    await _orderHistoryProvider.addOrderItem(
      userId,
      orderItemEntity,
    );
  }
}
