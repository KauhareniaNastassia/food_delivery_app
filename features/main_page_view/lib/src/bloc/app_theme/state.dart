part of 'bloc.dart';

class AppThemeState {
  final bool appThemeIsChanged;

  const AppThemeState({
    required this.appThemeIsChanged,
  });
}

class AppInitialThemeState extends AppThemeState {
  const AppInitialThemeState({required bool appThemeIsChanged})
      : super(appThemeIsChanged: appThemeIsChanged);
}
