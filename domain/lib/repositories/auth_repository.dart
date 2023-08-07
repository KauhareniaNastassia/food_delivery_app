import 'package:domain/domain.dart';

abstract class AuthRepository {
  Future<UserInfoModel> checkIsUserLogged();

  Future<UserInfoModel> signUp({
    required String userName,
    required String email,
    required String password,
  });

  Future<UserInfoModel> signIn({
    required String email,
    required String password,
  });

  Future<UserInfoModel> signInViaGoogle();

  Future<void> signOut();

  Future<String> getUserId();
}
