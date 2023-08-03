import 'package:domain/domain.dart';

class CheckIsUserLoggedUseCase
    implements FutureUseCase<NoParams, UserInfoModel> {
  final AuthRepository _authRepository;

  CheckIsUserLoggedUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserInfoModel> execute(NoParams input) async {
    return _authRepository.checkIsUserLogged();
  }
}
