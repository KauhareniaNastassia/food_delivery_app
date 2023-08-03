import 'dart:async';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthProvider _authProvider;
  final LocalAuthProvider _localAuthProvider;

  AuthRepositoryImpl({
    required AuthProvider authProvider,
    required LocalAuthProvider localAuthProvider,
  })  : _authProvider = authProvider,
        _localAuthProvider = localAuthProvider;

  @override
  Future<UserInfoModel> checkIsUserLogged() async {
    final UserInfoEntity userInfoEntity =
        await _localAuthProvider.checkIsUserInLocal();
    return UserInfoMapper.toModel(userInfoEntity);
  }

  @override
  Future<UserInfoModel> signIn({
    required String email,
    required String password,
  }) async {
    final UserInfoEntity userInfoEntity =
        await _authProvider.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final UserInfoModel userInfoModel = UserInfoMapper.toModel(userInfoEntity);
    await _localAuthProvider.setUserToLocal(userInfoModel);
    return userInfoModel;
  }

  @override
  Future<UserInfoModel> signInViaGoogle() async {
    final UserInfoEntity userInfoEntity =
        await _authProvider.signInWithGoogle();

    final UserInfoModel userInfoModel = UserInfoMapper.toModel(userInfoEntity);
    await _localAuthProvider.setUserToLocal(userInfoModel);
    return userInfoModel;
  }

  @override
  Future<UserInfoModel> signUp({
    required String userName,
    required String email,
    required String password,
  }) async {
    final UserInfoEntity userInfoEntity =
        await _authProvider.createUserWithEmailAndPassword(
      userName: userName,
      email: email,
      password: password,
    );
    final UserInfoModel userInfoModel = UserInfoMapper.toModel(userInfoEntity);
    await _localAuthProvider.setUserToLocal(userInfoModel);
    return userInfoModel;
  }

  @override
  Future<void> signOut() async {
    await _authProvider.signOut();
    await _localAuthProvider.removeUserFromLocal();
  }
}
