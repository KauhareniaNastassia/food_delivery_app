import 'package:domain/domain.dart';

class GetUserIdUseCase implements FutureUseCase<NoParams, String> {
  final AuthRepository _authRepository;

  GetUserIdUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<String> execute(NoParams input) async {
    return _authRepository.getUserId();
  }
}
