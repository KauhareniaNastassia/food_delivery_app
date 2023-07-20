abstract class SettingsRepository {
  Future<bool> getTheme();
  Future<void> setTheme(bool isLight);
  Future<bool> getColorScheme();
  Future<void> setColorScheme(bool isStandard);
}
