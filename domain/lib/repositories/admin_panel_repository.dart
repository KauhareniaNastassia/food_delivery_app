import 'dart:io';

import 'package:domain/domain.dart';

abstract class AdminPanelRepository {
  Future<List<UserInfoModel>> fetchUsers();

  Future<UserInfoModel> changeUserRole({
    required String newUserRoleValue,
    required String userId,
  });

  Future<List<OrderItemForAdminModel>> fetchAllOrders();

  Future<OrderItemForAdminModel> changeOrderStatus({
    required String userId,
    required int orderId,
  });

  Future<void> saveMenuItemChanges({
    required MenuItemModel updatedMenuItem,
  });

  Future<void> addNewMenuItem({
    required MenuItemModel newMenuItem,
  });

  Future<void> deleteMenuItem({
    required String menuItemId,
  });

  Future<String> uploadNewImage({
    required File uploadedMenuItemImage,
  });
}
