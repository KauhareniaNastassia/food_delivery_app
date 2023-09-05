import 'package:data/providers/hive_provider.dart';
import 'package:mockito/mockito.dart';

class MockHiveProvider extends Mock implements HiveProvider {
  @override
  Future<bool> getThemeFromLocal() {
    return Future(() => true);
  }

  @override
  Future<double> getFontSizeFromLocal() {
    return Future(() => 1.2);
  }

  @override
  Future<bool> getColorSchemeFromLocal() {
    return Future(() => true);
  }

  @override
  Future<void> setThemeToLocal(bool isLight) => Future(() => {});

  @override
  Future<void> setColorSchemeToLocal(bool isStandard) => Future(() => {});

  @override
  Future<void> setFontSizeToLocal(double fontSize) => Future(() => {});
}
