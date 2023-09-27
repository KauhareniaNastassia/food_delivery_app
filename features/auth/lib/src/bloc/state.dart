part of 'bloc.dart';

class AuthState {
  final bool isUserLoggedIn;
  final bool isDataProcessing;
  final bool isSignInPage;
  final String userId;
  final String userName;
  final String email;
  final String userRole;
  final String? exception;
  final String? signInFailedMessage;
  final String? signUpFailedMessage;
  final String password;
  final bool isTextObscured;

  const AuthState({
    required this.isUserLoggedIn,
    required this.isDataProcessing,
    required this.isSignInPage,
    required this.userId,
    required this.userName,
    required this.email,
    required this.userRole,
    required this.password,
    required this.isTextObscured,
    this.exception,
    this.signInFailedMessage,
    this.signUpFailedMessage,
  });

  const AuthState.initial({
    this.isUserLoggedIn = false,
    this.isSignInPage = true,
    this.isDataProcessing = false,
    this.isTextObscured = true,
    this.userId = '',
    this.userName = '',
    this.email = '',
    this.userRole = '',
    this.exception = '',
    this.signInFailedMessage = '',
    this.signUpFailedMessage = '',
    this.password = '',
  });

  AuthState copyWith({
    bool? isUserLoggedIn,
    bool? isDataProcessing,
    bool? isSignInPage,
    bool? isTextObscured,
    String? userId,
    String? userName,
    String? email,
    String? userRole,
    String? password,
    String? exception,
    String? signInFailedMessage,
    String? signUpFailedMessage,
  }) {
    return AuthState(
      isUserLoggedIn: isUserLoggedIn ?? this.isUserLoggedIn,
      isDataProcessing: isDataProcessing ?? this.isDataProcessing,
      isSignInPage: isSignInPage ?? this.isSignInPage,
      isTextObscured: isTextObscured ?? this.isTextObscured,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      userRole: userRole ?? this.userRole,
      password: password ?? this.password,
      exception: exception ?? this.exception,
      signInFailedMessage: signInFailedMessage ?? this.signInFailedMessage,
      signUpFailedMessage: signUpFailedMessage ?? this.signUpFailedMessage,
    );
  }
}
