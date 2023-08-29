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
          (OrderItemForAdminEntity e) => OrderItemForAdminMapper.toModel(e),
        )
        .toList();
    return allOrders;
  }

  @override
  Future<void> changeOrderStatus({
    required String userId,
    required int orderId,
  }) async {
    await _firebaseFireStoreProvider.changeOrderStatus(
      userId: userId,
      orderId: orderId,
    );
  }
}
