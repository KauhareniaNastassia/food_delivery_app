import 'package:domain/domain.dart';

class SetFontSizeUseCase implements FutureUseCase<double, void> {
  final SettingsRepository _settingsRepository;

  const SetFontSizeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<void> execute(double value) async {
    return _settingsRepository.setFontSize(value);
  }
}
