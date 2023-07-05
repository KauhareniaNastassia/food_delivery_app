import 'package:core/core.dart';

part 'event.dart';
part 'state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(const AppThemeState(isLight: true)) {
    on<AppThemeChangingEvent>(_appThemeChanged);
  }

  _appThemeChanged(
    AppThemeEvent event,
    Emitter<AppThemeState> emit,
  ) {
    emit(
      state.copyWith(isLight: !state.isLight),
    );
  }
}
