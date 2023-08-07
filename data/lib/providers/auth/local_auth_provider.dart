import 'package:data/data.dart';
import 'package:domain/domain.dart';

class LocalAuthProvider {
  const LocalAuthProvider();

  Future<String> getUserIdFromLocal() async {
    final Box<UserInfoEntity> userInfoBox = await Hive.openBox('userInfo');
    final UserInfoEntity userInfoEntity = userInfoBox.values.first;
    return userInfoEntity.userId;
  }

  Future<void> setUserToLocal(UserInfoModel userInfo) async {
    final Box<UserInfoEntity> userInfoBox = await Hive.openBox('userInfo');
    final UserInfoEntity userInfoEntity = UserInfoMapper.toEntity(userInfo);
    await userInfoBox.add(userInfoEntity);
  }

  Future<UserInfoEntity> checkIsUserInLocal() async {
    final Box<UserInfoEntity> userInfoBox = await Hive.openBox('userInfo');

    if (userInfoBox.isEmpty) {
      return UserInfoEntity(
        userName: '',
        email: '',
        userId: '',
      );
    } else {
      return userInfoBox.values.first;
    }
  }

  Future<void> removeUserFromLocal() async {
    final Box<UserInfoEntity> userInfoBox = await Hive.openBox('userInfo');
    await userInfoBox.clear();
  }
}
