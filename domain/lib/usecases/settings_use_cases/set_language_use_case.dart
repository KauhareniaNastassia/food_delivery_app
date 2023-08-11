import 'package:domain/domain.dart';

class SetLanguageUseCase implements FutureUseCase<bool, void> {
  final SettingsRepository _settingsRepository;

  const SetLanguageUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<void> execute(bool value) async {
    return _settingsRepository.setLanguage(value);
  }
}
