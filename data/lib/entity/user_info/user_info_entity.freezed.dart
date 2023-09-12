// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfoEntity _$UserInfoEntityFromJson(Map<String, dynamic> json) {
  return _UserInfoEntity.fromJson(json);
}

/// @nodoc
mixin _$UserInfoEntity {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get userRole => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoEntityCopyWith<UserInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoEntityCopyWith<$Res> {
  factory $UserInfoEntityCopyWith(
          UserInfoEntity value, $Res Function(UserInfoEntity) then) =
      _$UserInfoEntityCopyWithImpl<$Res, UserInfoEntity>;
  @useResult
  $Res call({String userId, String userName, String email, String userRole});
}

/// @nodoc
class _$UserInfoEntityCopyWithImpl<$Res, $Val extends UserInfoEntity>
    implements $UserInfoEntityCopyWith<$Res> {
  _$UserInfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? email = null,
    Object? userRole = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userRole: null == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInfoEntityCopyWith<$Res>
    implements $UserInfoEntityCopyWith<$Res> {
  factory _$$_UserInfoEntityCopyWith(
          _$_UserInfoEntity value, $Res Function(_$_UserInfoEntity) then) =
      __$$_UserInfoEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String userName, String email, String userRole});
}

/// @nodoc
class __$$_UserInfoEntityCopyWithImpl<$Res>
    extends _$UserInfoEntityCopyWithImpl<$Res, _$_UserInfoEntity>
    implements _$$_UserInfoEntityCopyWith<$Res> {
  __$$_UserInfoEntityCopyWithImpl(
      _$_UserInfoEntity _value, $Res Function(_$_UserInfoEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? email = null,
    Object? userRole = null,
  }) {
    return _then(_$_UserInfoEntity(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userRole: null == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInfoEntity implements _UserInfoEntity {
  _$_UserInfoEntity(
      {required this.userId,
      required this.userName,
      required this.email,
      required this.userRole});

  factory _$_UserInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoEntityFromJson(json);

  @override
  final String userId;
  @override
  final String userName;
  @override
  final String email;
  @override
  final String userRole;

  @override
  String toString() {
    return 'UserInfoEntity(userId: $userId, userName: $userName, email: $email, userRole: $userRole)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfoEntity &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userRole, userRole) ||
                other.userRole == userRole));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, userName, email, userRole);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoEntityCopyWith<_$_UserInfoEntity> get copyWith =>
      __$$_UserInfoEntityCopyWithImpl<_$_UserInfoEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoEntityToJson(
      this,
    );
  }
}

abstract class _UserInfoEntity implements UserInfoEntity {
  factory _UserInfoEntity(
      {required final String userId,
      required final String userName,
      required final String email,
      required final String userRole}) = _$_UserInfoEntity;

  factory _UserInfoEntity.fromJson(Map<String, dynamic> json) =
      _$_UserInfoEntity.fromJson;

  @override
  String get userId;
  @override
  String get userName;
  @override
  String get email;
  @override
  String get userRole;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoEntityCopyWith<_$_UserInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
