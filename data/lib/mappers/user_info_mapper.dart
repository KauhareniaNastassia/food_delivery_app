import 'package:domain/domain.dart';
import 'package:data/data.dart';

abstract class UserInfoMapper {
  static UserInfoEntity toEntity(UserInfoModel model) {
    return UserInfoEntity(
      userId: model.userId,
      userName: model.userName,
      email: model.email,
    );
  }

  static UserInfoModel toModel(UserInfoEntity entity) {
    return UserInfoModel(
      userId: entity.userId,
      userName: entity.userName,
      email: entity.email,
    );
  }
}
