import '../data.dart';

class SettingsLocalProvider {
  SettingsLocalProvider();

  Future<bool> getThemeFromLocal() async {
    final Box theme = await Hive.openBox('theme');
    return theme.get('isLight').toString() == 'true';
  }

  Future<void> setThemeToLocal(bool isLight) async {
    final Box theme = await Hive.openBox('theme');
    theme.put('isLight', isLight.toString());
  }

  Future<bool> getColorSchemeFromLocal() async {
    final Box colorScheme = await Hive.openBox('colorScheme');
    return colorScheme.get('colorScheme').toString() == 'true';
  }

  Future<void> setColorSchemeToLocal(bool isStandard) async {
    final Box colorScheme = await Hive.openBox('colorScheme');
    colorScheme.put('colorScheme', isStandard.toString());
  }
}
