import 'package:data/data.dart';
import 'package:domain/domain.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final HiveProvider _hiveProvider;

  SettingsRepositoryImpl({
    required HiveProvider hiveProvider,
  }) : _hiveProvider = hiveProvider;

  @override
  Future<bool> getTheme() async {
    return _hiveProvider.getThemeFromLocal();
  }

  @override
  Future<void> setTheme(bool isLight) async {
    return _hiveProvider.setThemeToLocal(isLight);
  }

  @override
  Future<bool> getColorScheme() async {
    return _hiveProvider.getColorSchemeFromLocal();
  }

  @override
  Future<void> setColorScheme(bool isStandard) async {
    return _hiveProvider.setColorSchemeToLocal(isStandard);
  }

  @override
  Future<double> getFontSize() async {
    return _hiveProvider.getFontSizeFromLocal();
  }

  @override
  Future<void> setFontSize(double fontSize) async {
    return _hiveProvider.setFontSizeToLocal(fontSize);
  }

  @override
  Future<bool> getLanguage() async {
    return _hiveProvider.getLanguageFromLocal();
  }

  @override
  Future<void> setLanguage(bool isEnglishLanguage) {
    return _hiveProvider.setLanguageToLocal(isEnglishLanguage);
  }
}
