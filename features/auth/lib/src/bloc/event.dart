part of 'bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class InitAuthEvent extends AuthEvent {
  InitAuthEvent();
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({
    required this.email,
    required this.password,
  });
}

class SignUpEvent extends AuthEvent {
  final String userName;
  final String email;
  final String password;

  SignUpEvent({
    required this.userName,
    required this.email,
    required this.password,
  });
}

class SignOutEvent extends AuthEvent {
  SignOutEvent();
}

class SignInViaGoogleEvent extends AuthEvent {
  SignInViaGoogleEvent();
}

class ChangeAuthPageEvent extends AuthEvent {
  ChangeAuthPageEvent();
}

class NavigateToSignInPageEvent extends AuthEvent {
  NavigateToSignInPageEvent();
}

class NavigateToAdminPanelPageEvent extends AuthEvent {
  NavigateToAdminPanelPageEvent();
}

class ObscurePasswordEvent extends AuthEvent {
  ObscurePasswordEvent();
}