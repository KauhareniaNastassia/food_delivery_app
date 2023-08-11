import 'package:domain/domain.dart';

class GetLanguageUseCase implements FutureUseCase<NoParams, bool> {
  final SettingsRepository _settingsRepository;

  const GetLanguageUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<bool> execute(NoParams value) async {
    return _settingsRepository.getLanguage();
  }
}