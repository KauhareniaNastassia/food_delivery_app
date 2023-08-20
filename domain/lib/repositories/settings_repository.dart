abstract class SettingsRepository {
  Future<bool> getTheme();

  Future<void> setTheme(bool isLight);

  Future<bool> getColorScheme();

  Future<void> setColorScheme(bool isStandard);

  Future<double> getFontSize();

  Future<void> setFontSize(double fontSize);
}
