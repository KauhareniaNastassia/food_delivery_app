import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'event.dart';
part 'state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckIsUserLoggedUseCase _checkIsUserLoggedUseCase;
  final SignInUseCase _signInUseCase;
  final SignInViaGoogleUseCase _signInViaGoogleUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;

  AuthBloc({
    required CheckIsUserLoggedUseCase checkIsUserLoggedUseCase,
    required SignInUseCase signInUseCase,
    required SignInViaGoogleUseCase signInViaGoogleUseCase,
    required SignUpUseCase signUpUseCase,
    required SignOutUseCase signOutUseCase,
  })  : _checkIsUserLoggedUseCase = checkIsUserLoggedUseCase,
        _signInUseCase = signInUseCase,
        _signInViaGoogleUseCase = signInViaGoogleUseCase,
        _signUpUseCase = signUpUseCase,
        _signOutUseCase = signOutUseCase,
        super(const AuthState.initial()) {
    on<InitAuthEvent>(_onInitAuth);
    on<SignInEvent>(_onSignIn);
    on<SignInViaGoogleEvent>(_signInViaGoogle);
    on<SignUpEvent>(_onSignUp);
    on<SignOutEvent>(_onSignOut);

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
          exception: '',
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
          signInFailedMessage: e.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isDataProcessing: false,
          exception: e.toString(),
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
          userName: userInfo.userName,
          email: userInfo.email,
          userId: userInfo.userId,
        ),
      );
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          isDataProcessing: false,
          signUpFailedMessage: e.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isDataProcessing: false,
          exception: e.toString(),
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
        state.copyWith(
          isDataProcessing: false,
          isUserLoggedIn: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isDataProcessing: false,
          exception: e.toString(),
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
          exception: e.toString(),
        ),
      );
    }
  }
}
