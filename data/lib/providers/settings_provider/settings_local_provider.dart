import 'package:data/data.dart';

class SettingsLocalProvider {
  SettingsLocalProvider();

  Future<bool> getThemeFromLocal() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    final Box theme = await Hive.openBox('theme');
    return theme.isEmpty ? true : theme.get('isLight').toString() == 'true';
  }

  Future<void> setThemeToLocal(bool isLight) async {
    final Box theme = await Hive.openBox('theme');
    theme.put(
      'isLight',
      isLight.toString(),
    );
  }

  Future<bool> getColorSchemeFromLocal() async {
    final Box colorScheme = await Hive.openBox('colorScheme');
    return colorScheme.isEmpty
        ? true
        : colorScheme.get('colorScheme').toString() == 'true';
  }

  Future<void> setColorSchemeToLocal(bool isStandard) async {
    final Box colorScheme = await Hive.openBox('colorScheme');
    colorScheme.put(
      'colorScheme',
      isStandard.toString(),
    );
  }

  Future<double> getFontSizeFromLocal() async {
    final Box colorScheme = await Hive.openBox('fontSize');
    if (colorScheme.isEmpty) {
      return 1.0;
    } else {
      final String fontSize = colorScheme.get('fontSize').toString();
      return double.parse(fontSize);
    }
  }

  Future<void> setFontSizeToLocal(double fontSize) async {
    final Box colorScheme = await Hive.openBox('fontSize');
    colorScheme.put(
      'fontSize',
      fontSize.toString(),
    );
  }
}
