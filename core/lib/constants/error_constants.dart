final class ErrorConstants {
  ///errors from firebase
  static const userNotFoundResponseError =
      '[firebase_auth/user-not-found] There is no user record corresponding '
      'to this identifier. The user may have been deleted.';
  static const wrongPasswordResponseError =
      '[firebase_auth/wrong-password] The password is invalid '
      'or the user does not have a password.';
  static const userAlreadyExistResponseError =
      '[firebase_auth/email-already-in-use] The email address '
      'is already in use by another account.';

  ///errors for ui
  static const userNotFoundError = 'User isn\'t registered';
  static const wrongPasswordError = 'Wrong password';
  static const userAlreadyExistError = 'Wrong password';
  static const somethingWentWrongError = 'Wrong password';
}
