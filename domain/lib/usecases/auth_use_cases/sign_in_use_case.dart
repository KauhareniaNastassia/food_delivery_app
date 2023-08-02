import 'package:domain/domain.dart';

class SignInUseCase implements FutureUseCase<SignInInfo, UserInfoModel> {
  final AuthRepository _authRepository;

  SignInUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserInfoModel> execute(SignInInfo signInInfo) async {
    return _authRepository.signIn(
      email: signInInfo.email,
      password: signInInfo.password,
    );
  }
}
