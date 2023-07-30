part of 'bloc.dart';

class AuthState {
  final bool isUserLoggedIn;
  final bool isDataProcessing;
  final String userId;
  final String userName;
  final String email;
  final String? exception;
  final String? signInFailedMessage;
  final String? signUpFailedMessage;

  const AuthState({
    required this.isUserLoggedIn,
    required this.isDataProcessing,
    required this.userId,
    required this.userName,
    required this.email,
    this.exception,
    this.signInFailedMessage,
    this.signUpFailedMessage,
  });

  const AuthState.initial({
    this.isUserLoggedIn = false,
    this.isDataProcessing = false,
    this.userId = '',
    this.userName = '',
    this.email = '',
    this.exception = '',
    this.signInFailedMessage = '',
    this.signUpFailedMessage = '',
  });

  AuthState copyWith({
    bool? isUserLoggedIn,
    bool? isDataProcessing,
    String? userId,
    String? userName,
    String? email,
    String? exception,
    String? signInFailedMessage,
    String? signUpFailedMessage,
  }) {
    return AuthState(
      isUserLoggedIn: isUserLoggedIn ?? this.isUserLoggedIn,
      isDataProcessing: isDataProcessing ?? this.isDataProcessing,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      exception: exception ?? this.exception,
      signInFailedMessage: signInFailedMessage ?? this.signInFailedMessage,
      signUpFailedMessage: signUpFailedMessage ?? this.signUpFailedMessage,
    );
  }
}
