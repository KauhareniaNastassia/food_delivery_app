import 'package:data/data.dart';
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
}
