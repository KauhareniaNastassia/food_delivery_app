import 'package:domain/domain.dart';

class GetColorSchemeUseCase implements FutureUseCase<NoParams, bool> {
  final SettingsRepository _settingsRepository;

  const GetColorSchemeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<bool> execute(NoParams value) async {
    return _settingsRepository.getColorScheme();
  }
}
