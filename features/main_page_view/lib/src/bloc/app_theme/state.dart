part of 'bloc.dart';

class AppThemeState {
  final bool isLight;

  const AppThemeState({
    required this.isLight,
  });

  AppThemeState copyWith({required bool isLight}) {
    return AppThemeState(
      isLight: isLight,
    );
  }
}
