import 'package:data/data.dart';
import 'package:domain/domain.dart';

class OrderHistoryRepositoryImpl implements OrderHistoryRepository {
  final FirebaseFireStoreProvider _firebaseFireStoreProvider;

  const OrderHistoryRepositoryImpl({
    required FirebaseFireStoreProvider firebaseFireStoreProvider,
  }) : _firebaseFireStoreProvider = firebaseFireStoreProvider;

  @override
  Future<List<OrderItemModel>> fetchOrderHistory(String userId) async {
    final List<OrderItemEntity> result =
        await _firebaseFireStoreProvider.fetchOrderHistory(userId);

    final List<OrderItemModel> orderItems = result
        .map(
          (OrderItemEntity e) => OrderItemMapper.toModel(e),
        )
        .toList();
    return orderItems;
  }

  @override
  Future<void> createOrderItem({
    required String userId,
    required OrderItemModel orderItem,
  }) async {
    final OrderItemEntity orderItemEntity = OrderItemMapper.toEntity(orderItem);
    await _firebaseFireStoreProvider.addOrderItem(
      userId: userId,
      orderItem: orderItemEntity,
    );
  }
}
