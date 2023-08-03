part of 'bloc.dart';

class SettingsState {
  final bool isLight;
  final bool isStandardColorScheme;
  final double fontSize;

  const SettingsState({
    required this.isLight,
    required this.isStandardColorScheme,
    required this.fontSize,
  });

   const SettingsState.empty({
    this.isLight = true,
    this.isStandardColorScheme = true,
    this.fontSize = 1.0,
  });

  SettingsState copyWith({
    bool? isLight,
    bool? isStandardColorScheme,
    double? fontSize,
  }) {
    return SettingsState.empty(
      isLight: isLight ?? this.isLight,
      isStandardColorScheme: isStandardColorScheme ?? this.isStandardColorScheme,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}
