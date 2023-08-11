part of 'bloc.dart';

class SettingsState {
  final bool isLight;
  final bool isStandardColorScheme;
  final double fontSize;
  final bool isEnglishLanguage;

  const SettingsState({
    required this.isLight,
    required this.isStandardColorScheme,
    required this.fontSize,
    required this.isEnglishLanguage,
  });

   const SettingsState.empty({
    this.isLight = true,
    this.isStandardColorScheme = true,
    this.fontSize = 1.0,
    this.isEnglishLanguage = true,
  });

  SettingsState copyWith({
    bool? isLight,
    bool? isStandardColorScheme,
    double? fontSize,
    bool? isEnglishLanguage,
  }) {
    return SettingsState.empty(
      isLight: isLight ?? this.isLight,
      isStandardColorScheme: isStandardColorScheme ?? this.isStandardColorScheme,
      fontSize: fontSize ?? this.fontSize,
      isEnglishLanguage: isEnglishLanguage ?? this.isEnglishLanguage,
    );
  }
}
