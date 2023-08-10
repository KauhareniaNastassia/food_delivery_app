import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'event.dart';
part 'state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckIsUserLoggedUseCase _checkIsUserLoggedUseCase;
  final SignInUseCase _signInUseCase;
  final SignInViaGoogleUseCase _signInViaGoogleUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;
  final AppRouter _appRouter;

  AuthBloc({
    required CheckIsUserLoggedUseCase checkIsUserLoggedUseCase,
    required SignInUseCase signInUseCase,
    required SignInViaGoogleUseCase signInViaGoogleUseCase,
    required SignUpUseCase signUpUseCase,
    required SignOutUseCase signOutUseCase,
    required AppRouter appRouter,
  })  : _checkIsUserLoggedUseCase = checkIsUserLoggedUseCase,
        _signInUseCase = signInUseCase,
        _signInViaGoogleUseCase = signInViaGoogleUseCase,
        _signUpUseCase = signUpUseCase,
        _signOutUseCase = signOutUseCase,
        _appRouter = appRouter,
        super(const AuthState.initial()) {
    on<InitAuthEvent>(_onInitAuth);
    on<SignInEvent>(_onSignIn);
    on<SignInViaGoogleEvent>(_signInViaGoogle);
    on<SignUpEvent>(_onSignUp);
    on<SignOutEvent>(_onSignOut);
    on<ChangeAuthPageEvent>(_changeAuthPage);
    on<NavigateToSignInPageEvent>(_onNavigateToSignInPage);

    add(
      InitAuthEvent(),
    );
  }

  Future<void> _onInitAuth(
    InitAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        isDataProcessing: true,
      ),
    );
    try {
      final UserInfoModel userFromLocal =
          await _checkIsUserLoggedUseCase.execute(
        const NoParams(),
      );

      userFromLocal.userId.isEmpty
          ? emit(
              const AuthState.initial(),
            )
          : emit(
              state.copyWith(
                isDataProcessing: false,
                isUserLoggedIn: true,
                userId: userFromLocal.userId,
                userName: userFromLocal.userName,
                email: userFromLocal.email,
              ),
            );
    } catch (e) {
      emit(
        state.copyWith(
          exception: ErrorConstants.somethingWentWrongError,
        ),
      );
    }
  }

  Future<void> _onSignIn(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        isDataProcessing: true,
        exception: '',
        signInFailedMessage: '',
      ),
    );
    try {
      final UserInfoModel userInfo = await _signInUseCase.execute(
        SignInInfo(
          email: event.email,
          password: event.password,
        ),
      );
      emit(
        state.copyWith(
          isDataProcessing: false,
          isUserLoggedIn: true,
          userName: userInfo.userName,
          userId: userInfo.userId,
          email: userInfo.email,
        ),
      );
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          isDataProcessing: false,
          signInFailedMessage:
              e.toString() == ErrorConstants.userNotFoundResponseError
                  ? ErrorConstants.userNotFoundError
                  : e.toString() == ErrorConstants.wrongPasswordResponseError
                      ? ErrorConstants.wrongPasswordError
                      : ErrorConstants.somethingWentWrongError,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isDataProcessing: false,
          exception: ErrorConstants.somethingWentWrongError,
        ),
      );
    }
  }

  Future<void> _onSignUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        isDataProcessing: true,
        exception: '',
        signUpFailedMessage: '',
      ),
    );
    try {
      final UserInfoModel userInfo = await _signUpUseCase.execute(
        SignUpInfo(
          userName: event.userName,
          password: event.password,
          email: event.email,
        ),
      );

      emit(
        state.copyWith(
          isUserLoggedIn: true,
          isDataProcessing: false,
          isSignInPage: true,
          userName: userInfo.userName,
          email: userInfo.email,
          userId: userInfo.userId,
        ),
      );
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          isDataProcessing: false,
          signUpFailedMessage:
              e.toString() == ErrorConstants.userAlreadyExistResponseError
                  ? ErrorConstants.userAlreadyExistError
                  : ErrorConstants.somethingWentWrongError,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isDataProcessing: false,
          exception: ErrorConstants.somethingWentWrongError,
        ),
      );
    }
  }

  Future<void> _onSignOut(
    SignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        isDataProcessing: true,
      ),
    );
    try {
      await _signOutUseCase.execute(
        const NoParams(),
      );

      emit(
          const AuthState.initial(),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isDataProcessing: false,
          exception: ErrorConstants.somethingWentWrongError,
        ),
      );
    }
  }

  Future<void> _signInViaGoogle(
    SignInViaGoogleEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        isDataProcessing: true,
      ),
    );
    try {
      final UserInfoModel userInfo = await _signInViaGoogleUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          isUserLoggedIn: true,
          isDataProcessing: false,
          userName: userInfo.userName,
          email: userInfo.email,
          userId: userInfo.userId,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isDataProcessing: false,
          exception: ErrorConstants.somethingWentWrongError,
        ),
      );
    }
  }

  void _changeAuthPage(
    ChangeAuthPageEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(
        isSignInPage: !state.isSignInPage,
      ),
    );
  }

  void _onNavigateToSignInPage(
    NavigateToSignInPageEvent event,
    Emitter<AuthState> emit,
  ) {
    _appRouter.navigate(
      const SignInPageScreenRoute(),
    );
  }
}
