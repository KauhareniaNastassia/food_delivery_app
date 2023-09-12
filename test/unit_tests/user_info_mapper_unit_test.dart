import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserInfoMapper', () {
    test('toEntity should convert UserInfoModel to UserInfoEntity', () {
      final UserInfoModel model = UserInfoModel(
        userId: 'userId',
        email: 'email@mail.ru',
        userName: 'Nastassia',
        userRole: 'admin',
      );

      final UserInfoEntity entity = UserInfoMapper.toEntity(model);

      expect(entity.userId, equals(model.userId));
      expect(entity.email, equals(model.email));
      expect(entity.userName, equals(model.userName));
      expect(entity.userRole, equals(model.userRole));
    });

    test('toModel should convert UserInfoEntity to UserInfoModel', () {
      final UserInfoEntity entity = UserInfoEntity(
        userId: 'userId',
        email: 'email@mail.ru',
        userName: 'Nastassia',
        userRole: 'admin',
      );

      final UserInfoModel model = UserInfoMapper.toModel(entity);

      expect(model.userId, equals(entity.userId));
      expect(model.email, equals(entity.email));
      expect(model.userName, equals(entity.userName));
      expect(model.userRole, equals(entity.userRole));
    });
  });
}
