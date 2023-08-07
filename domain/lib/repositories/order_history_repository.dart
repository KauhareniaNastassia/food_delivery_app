import 'package:domain/domain.dart';

abstract class OrderHistoryRepository {
  Future<List<OrderItemModel>> fetchOrderHistory(String userId);

  Future<void> createOrderItem(OrderItemModel orderItem);
}
