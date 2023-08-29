import 'package:domain/domain.dart';

abstract class AdminPanelRepository {
  Future<List<UserInfoModel>> fetchUsers();

  Future<UserInfoModel> changeUserRole({
    required String newUserRoleValue,
    required String userId,
  });

  Future<List<OrderItemForAdminModel>> fetchAllOrders();

  Future<void> changeOrderStatus({
    required String userId,
    required int orderId,
  });
}
