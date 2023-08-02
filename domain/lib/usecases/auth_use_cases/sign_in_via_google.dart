import 'dart:developer';

import 'package:domain/domain.dart';

class SignInViaGoogleUseCase implements FutureUseCase<NoParams, UserInfoModel> {
  final AuthRepository _authRepository;

  SignInViaGoogleUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserInfoModel> execute(NoParams input) {
    return _authRepository.signInViaGoogle();
  }
}
