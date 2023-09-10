import 'dart:async';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseFireStoreProvider _firebaseFireStoreProvider;
  final FirebaseAuthProvider _firebaseAuthProvider;
  final HiveProvider _hiveProvider;

  AuthRepositoryImpl({
    required FirebaseFireStoreProvider firebaseFireStoreProvider,
    required FirebaseAuthProvider firebaseAuthProvider,
    required HiveProvider hiveProvider,
  })  : _firebaseFireStoreProvider = firebaseFireStoreProvider,
        _firebaseAuthProvider = firebaseAuthProvider,
        _hiveProvider = hiveProvider;

  @override
  Future<UserInfoModel> checkIsUserLogged() async {
    final UserInfoEntity userInfoEntity =
    await _hiveProvider.checkIsUserInLocal();
    return UserInfoMapper.toModel(userInfoEntity);
  }

  @override
  Future<String> getUserId() async {
    final String userId = await _hiveProvider.getUserIdFromLocal();
    return userId;
  }

  @override
  Future<UserInfoModel> signIn({
    required String email,
    required String password,
  }) async {
    final String authUserId =
    await _firebaseAuthProvider.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final UserInfoEntity userInfoEntity =
    await _firebaseFireStoreProvider.getUserInfoFromDB(userId: authUserId);
    await _hiveProvider.setUserToLocal(userInfoEntity);
    final UserInfoModel userInfoModel = UserInfoMapper.toModel(userInfoEntity);
    return userInfoModel;
  }

  @override
  Future<UserInfoModel> signInViaGoogle() async {
    final UserCredential userCredential =
    await _firebaseAuthProvider.signInWithGoogle();

    final UserInfoEntity userInfoEntity = UserInfoEntity(
      userId: userCredential.user!.uid,
      email: userCredential.user!.email!,
      userName: userCredential.user!.displayName!,
    );

    await _firebaseFireStoreProvider.setUserToDB(
        userInfoEntity: userInfoEntity);

    await _hiveProvider.setUserToLocal(userInfoEntity);
    final UserInfoModel userInfoModel = UserInfoMapper.toModel(userInfoEntity);
    return userInfoModel;
  }

  @override
  Future<UserInfoModel> signUp({
    required String userName,
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential =
    await _firebaseAuthProvider.createUserWithEmailAndPassword(
      userName: userName,
      email: email,
      password: password,
    );

    final UserInfoEntity userInfoEntity = UserInfoEntity(
      userId: userCredential.user!.uid,
      email: userCredential.user!.email!,
      userName: userName,
    );

    await _firebaseFireStoreProvider.setUserToDB(
        userInfoEntity: userInfoEntity);

    await _hiveProvider.setUserToLocal(userInfoEntity);
    final UserInfoModel userInfoModel = UserInfoMapper.toModel(userInfoEntity);
    return userInfoModel;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuthProvider.signOut();
    await _hiveProvider.removeUserFromLocal();
  }
}