import 'dart:io';
import 'package:data/data.dart';
import 'package:data/mappers/order_item_for_admin_mapper.dart';
import 'package:domain/domain.dart';

class AdminPanelRepositoryImpl implements AdminPanelRepository {
  final FirebaseFireStoreProvider _firebaseFireStoreProvider;

  const AdminPanelRepositoryImpl({
    required FirebaseFireStoreProvider firebaseFireStoreProvider,
  }) : _firebaseFireStoreProvider = firebaseFireStoreProvider;

  @override
  Future<List<UserInfoModel>> fetchUsers() async {
    final List<UserInfoEntity> usersFromDB =
        await _firebaseFireStoreProvider.fetchUsers();
    final List<UserInfoModel> users = usersFromDB
        .map(
          (UserInfoEntity e) => UserInfoMapper.toModel(e),
        )
        .toList();

    return users;
  }

  @override
  Future<UserInfoModel> changeUserRole({
    required String newUserRoleValue,
    required String userId,
  }) async {
    await _firebaseFireStoreProvider.changeUserRole(
      newUserRoleValue: newUserRoleValue,
      userId: userId,
    );
    final UserInfoEntity userInfoEntity =
        await _firebaseFireStoreProvider.getUserInfoFromDB(userId: userId);
    final UserInfoModel userInfoModel = UserInfoMapper.toModel(userInfoEntity);

    return userInfoModel;
  }

  @override
  Future<List<OrderItemForAdminModel>> fetchAllOrders() async {
    final List<OrderItemForAdminEntity> allOrdersFromDB =
        await _firebaseFireStoreProvider.fetchAllOrders();

    final List<OrderItemForAdminModel> allOrders = allOrdersFromDB
        .map(
          (OrderItemForAdminEntity entity) =>
              OrderItemForAdminMapper.toModel(entity),
        )
        .toList();

    return allOrders;
  }

  @override
  Future<OrderItemForAdminModel> changeOrderStatus({
    required String userId,
    required int orderId,
  }) async {
    final OrderItemForAdminEntity updatedOrderItem =
        await _firebaseFireStoreProvider.changeOrderStatus(
      userId: userId,
      orderId: orderId,
    );

    return OrderItemForAdminMapper.toModel(updatedOrderItem);
  }

  @override
  Future<void> saveMenuItemChanges(MenuItemModel updatedMenuItem) async {
    final MenuItemEntity menuItemEntity =
        MenuItemMapper.toEntity(updatedMenuItem);

    await _firebaseFireStoreProvider.saveMenuItemChanges(menuItemEntity);
  }

  @override
  Future<void> addNewMenuItem(MenuItemModel newMenuItem) async {
    final MenuItemEntity newMenuItemEntity =
        MenuItemMapper.toEntity(newMenuItem);

    await _firebaseFireStoreProvider.addNewMenuItem(newMenuItemEntity);
  }

  @override
  Future<void> deleteMenuItem(String menuItemId) async {
    await _firebaseFireStoreProvider.deleteMenuItem(menuItemId);
  }

  @override
  Future<String> uploadNewImage(File uploadedMenuItemImage) async {
    final String newMenuItemImage =
        await _firebaseFireStoreProvider.uploadNewImage(uploadedMenuItemImage);

    return newMenuItemImage;
  }
}
