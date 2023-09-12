import 'package:data/repositories/settings_repository_impl/settings_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_for_unit_test.dart';

void main() {
  late SettingsRepositoryImpl settingsRepository;
  late MockHiveProvider mockHiveProvider;

  setUp(() {
    mockHiveProvider = MockHiveProvider();
    settingsRepository = SettingsRepositoryImpl(hiveProvider: mockHiveProvider);
  });
  group(
    'SettingsRepositoryImpl',
    () {
      test(
        'Check getTheme execution',
        () async {
          final bool result = await settingsRepository.getTheme();
          expect(result, true);
        },
      );
      test(
        'Check getFontSize execution',
        () async {
          final double result = await settingsRepository.getFontSize();
          expect(result, 1.2);
        },
      );
      test(
        'Check getColorScheme execution',
        () async {
          final bool result = await settingsRepository.getColorScheme();
          expect(result, true);
        },
      );
      test(
        'Check setTheme execution',
        () async {
          const bool isLight = true;
          await settingsRepository.setTheme(isLight);
          expect(await settingsRepository.getTheme(), true);
        },
      );
      test(
        'Check setColorScheme execution',
        () async {
          const bool isStandard = true;
          await settingsRepository.setColorScheme(isStandard);
          expect(await settingsRepository.getColorScheme(), true);
        },
      );
      test(
        'Check setFontSize execution',
        () async {
          const double fontSize = 1.2;
          await settingsRepository.setFontSize(fontSize);
          expect(await settingsRepository.getFontSize(), 1.2);
        },
      );
    },
  );
}
