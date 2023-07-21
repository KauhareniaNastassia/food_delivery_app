import 'package:domain/domain.dart';

class GetFontSizeUseCase implements FutureUseCase<NoParams, double> {
  final SettingsRepository _settingsRepository;

  const GetFontSizeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<double> execute(NoParams value) async {
    return _settingsRepository.getFontSize();
  }
}
