import 'package:data/data.dart';

class UserInfoEntityAdapter extends TypeAdapter<UserInfoEntity> {
  @override
  final int typeId = 2;

  @override
  UserInfoEntity read(BinaryReader reader) {
    return UserInfoEntity(
      userName: reader.read(),
      userId: reader.read(),
      email: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, UserInfoEntity obj) {
    writer.write(obj.userName);
    writer.write(obj.userId);
    writer.write(obj.email);
  }
}
