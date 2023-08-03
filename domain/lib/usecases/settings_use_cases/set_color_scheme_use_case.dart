import 'package:domain/domain.dart';

class SetColorSchemeUseCase implements FutureUseCase<bool, void> {
  final SettingsRepository _settingsRepository;

  const SetColorSchemeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<void> execute(bool value) async {
    return _settingsRepository.setColorScheme(value);
  }
}
