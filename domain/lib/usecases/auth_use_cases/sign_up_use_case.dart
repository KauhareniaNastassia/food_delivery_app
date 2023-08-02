import 'package:domain/domain.dart';

class SignUpUseCase implements FutureUseCase<SignUpInfo, UserInfoModel> {
  final AuthRepository _authRepository;

  SignUpUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserInfoModel> execute(SignUpInfo signUpInfo) {
    return _authRepository.signUp(
      userName: signUpInfo.userName,
      email: signUpInfo.email,
      password: signUpInfo.password,
    );
  }
}
