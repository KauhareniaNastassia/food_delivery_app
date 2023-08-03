import 'package:domain/domain.dart';

class SetThemeUseCase implements FutureUseCase<bool, void> {
  final SettingsRepository _settingsRepository;

  const SetThemeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<void> execute(bool value) async {
    return _settingsRepository.setTheme(value);
  }
}
