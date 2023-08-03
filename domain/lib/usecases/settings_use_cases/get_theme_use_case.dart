import 'package:domain/domain.dart';

class GetThemeUseCase implements FutureUseCase<NoParams, bool> {
  final SettingsRepository _settingsRepository;

  const GetThemeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<bool> execute(NoParams value) async {
    return _settingsRepository.getTheme();
  }
}
