import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'event.dart';
part 'state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetThemeUseCase _getThemeUseCase;
  final SetThemeUseCase _setThemeUseCase;
  final GetColorSchemeUseCase _getColorSchemeUseCase;
  final SetColorSchemeUseCase _setColorSchemeUseCase;
  final GetFontSizeUseCase _getFontSizeUseCase;
  final SetFontSizeUseCase _setFontSizeUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final SetLanguageUseCase _setLanguageUseCase;

  SettingsBloc({
    required GetThemeUseCase getThemeUseCase,
    required SetThemeUseCase setThemeUseCase,
    required GetColorSchemeUseCase getColorSchemeUseCase,
    required SetColorSchemeUseCase setColoSchemeUseCase,
    required GetFontSizeUseCase getFontSizeUseCase,
    required SetFontSizeUseCase setFontSizeUseCase,
    required GetLanguageUseCase getLanguageUseCase,
    required SetLanguageUseCase setLanguageUseCase,
  })  : _getThemeUseCase = getThemeUseCase,
        _setThemeUseCase = setThemeUseCase,
        _getColorSchemeUseCase = getColorSchemeUseCase,
        _setColorSchemeUseCase = setColoSchemeUseCase,
        _getFontSizeUseCase = getFontSizeUseCase,
        _setFontSizeUseCase = setFontSizeUseCase,
        _getLanguageUseCase = getLanguageUseCase,
        _setLanguageUseCase = setLanguageUseCase,
        super(const SettingsState.empty()) {
    on<InitAppSettings>(_initAppSettings);
    on<AppThemeChangingEvent>(_appThemeChanged);
    on<AppColorSchemeChangingEvent>(_appColorSchemeChanged);
    on<AppFontSizeChangingEvent>(_appFontSizeChanged);
    on<LanguageEvent>(_languageChanged);

    add(InitAppSettings());
  }

  Future<void> _initAppSettings(
    InitAppSettings event,
    Emitter<SettingsState> emit,
  ) async {
    final bool isLight = await _getThemeUseCase.execute(
      const NoParams(),
    );
    final bool isStandardColorScheme = await _getColorSchemeUseCase.execute(
      const NoParams(),
    );
    final double fontSize = await _getFontSizeUseCase.execute(
      const NoParams(),
    );
    final bool isEnglishLanguage = await _getLanguageUseCase.execute(
      const NoParams(),
    );

    emit(
      state.copyWith(
          isLight: isLight,
          isStandardColorScheme: isStandardColorScheme,
          fontSize: fontSize,
          isEnglishLanguage: isEnglishLanguage),
    );
  }

  Future<void> _languageChanged(
    LanguageEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _setLanguageUseCase.execute(!state.isEnglishLanguage);
    emit(
      state.copyWith(
        isEnglishLanguage: !state.isEnglishLanguage,
      ),
    );
  }

  Future<void> _appThemeChanged(
    AppThemeChangingEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _setThemeUseCase.execute(!state.isLight);
    emit(
      state.copyWith(
        isLight: !state.isLight,
      ),
    );
  }

  Future<void> _appColorSchemeChanged(
    AppColorSchemeChangingEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _setColorSchemeUseCase.execute(!state.isStandardColorScheme);

    emit(
      state.copyWith(
        isStandardColorScheme: !state.isStandardColorScheme,
      ),
    );
  }

  Future<void> _appFontSizeChanged(
    AppFontSizeChangingEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _setFontSizeUseCase.execute(event.fontSize);

    emit(
      state.copyWith(
        fontSize: event.fontSize,
      ),
    );
  }
}
