import 'package:data/data.dart';
import 'package:domain/domain.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalProvider _settingsLocalProvider;

  SettingsRepositoryImpl({
    required SettingsLocalProvider settingsLocalProvider,
  }) : _settingsLocalProvider = settingsLocalProvider;

  @override
  Future<bool> getTheme() async {
    return _settingsLocalProvider.getThemeFromLocal();
  }

  @override
  Future<void> setTheme(bool isLight) async {
    return _settingsLocalProvider.setThemeToLocal(isLight);
  }

  @override
  Future<bool> getColorScheme() async {
    return _settingsLocalProvider.getColorSchemeFromLocal();
  }

  @override
  Future<void> setColorScheme(bool isStandard) async {
    return _settingsLocalProvider.setColorSchemeToLocal(isStandard);
  }
}
