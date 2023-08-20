part of 'bloc.dart';

abstract class SettingsEvent {}

class InitAppSettings extends SettingsEvent {
  InitAppSettings();
}

class AppThemeChangingEvent extends SettingsEvent {
  AppThemeChangingEvent();
}

class AppColorSchemeChangingEvent extends SettingsEvent {
  AppColorSchemeChangingEvent();
}

class AppFontSizeChangingEvent extends SettingsEvent {
  final double fontSize;

  AppFontSizeChangingEvent({required this.fontSize});
}
