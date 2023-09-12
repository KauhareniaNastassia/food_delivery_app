// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfoEntity _$$_UserInfoEntityFromJson(Map<String, dynamic> json) =>
    _$_UserInfoEntity(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      userRole: json['userRole'] as String,
    );

Map<String, dynamic> _$$_UserInfoEntityToJson(_$_UserInfoEntity instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'userRole': instance.userRole,
    };
