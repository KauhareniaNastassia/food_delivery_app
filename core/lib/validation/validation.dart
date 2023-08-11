import 'dart:core';

import 'package:core/core.dart';

String? emailValidation({
  required String? email,
  required AppLocalizations appLocalization,
}) {
  if (email!.isEmpty) {
    return appLocalization.translate('enterEmail');
  }
  if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(email)) {
    return appLocalization.translate('enterValidEmail');
  }
  return null;
}

String? passwordValidation({
  required String? password,
  required AppLocalizations appLocalization,
}) {
  if (password!.isEmpty) {
    return appLocalization.translate('enterPassword');
  }
  if (password.length < 6) {
    return appLocalization.translate('shortPassword');
  }
  return null;
}

String? nameValidation({
  required String? name,
  required AppLocalizations appLocalization,
}) {
  if (name!.isEmpty) {
    return appLocalization.translate('enterName');
  }
  return null;
}
