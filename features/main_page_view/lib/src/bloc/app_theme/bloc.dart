import 'package:core/core.dart';

part 'event.dart';
part 'state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(const AppInitialThemeState(appThemeIsChanged: false)) {
    on<LightAppThemeEvent>((event, emit) {
      emit(const AppThemeState(appThemeIsChanged: true));
    });
    on<DarkAppThemeEvent>((event, emit) {
      emit(const AppThemeState(appThemeIsChanged: false));
    });
  }
}
