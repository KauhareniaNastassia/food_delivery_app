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

  Future<void> saveMenuItemChanges(MenuItemModel updatedMenuItem);

  Future<void> addNewMenuItem(MenuItemModel newMenuItem);

  Future<void> deleteMenuItem(String menuItemId);

  Future<String> uploadNewImage(File uploadedMenuItemImage);
}
