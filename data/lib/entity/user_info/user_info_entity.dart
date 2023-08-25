import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_entity.freezed.dart';
part 'user_info_entity.g.dart';

@freezed
class UserInfoEntity with _$UserInfoEntity {
  factory UserInfoEntity({
    required String userId,
    required String userName,
    required String email,
    required String userRole,
  }) = _UserInfoEntity;

  factory UserInfoEntity.fromJson(Map<String, Object?> json) =>
      _$UserInfoEntityFromJson(json);
}
