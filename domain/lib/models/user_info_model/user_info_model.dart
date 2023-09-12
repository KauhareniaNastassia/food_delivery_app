import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_model.freezed.dart';

@freezed
class UserInfoModel with _$UserInfoModel {
  factory UserInfoModel({
    required String userId,
    required String userName,
    required String email,
    required String userRole,
  }) = _UserInfoModel;
}
