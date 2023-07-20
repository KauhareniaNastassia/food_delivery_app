part of 'bloc.dart';

class SettingsState {
  final bool isLight;
  final bool isStandardColorScheme;

  const SettingsState({
    required this.isLight,
    required this.isStandardColorScheme,
  });

   const SettingsState.empty({
    this.isLight = true,
    this.isStandardColorScheme = true,
  });

  SettingsState copyWith({
    bool? isLight,
    bool? isStandardColorScheme,
  }) {
    return SettingsState.empty(
      isLight: isLight ?? this.isLight,
      isStandardColorScheme: isStandardColorScheme ?? this.isStandardColorScheme,
    );
  }
}
