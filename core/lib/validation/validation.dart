import 'dart:core';

import 'package:core/core.dart';

String? emailValidation({
  required String? email,
}) {
  if (email!.isEmpty) {
    return 'enterEmail'.tr();
  }
  if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(email)) {
    return 'enterValidEmail'.tr();
  }
  return null;
}

String? passwordValidation({
  required String? password,
}) {
  if (password!.isEmpty) {
    return 'enterPassword'.tr();
  }
  if (password.length < 6) {
    return 'shortPassword'.tr();
  }
  return null;
}

String? nameValidation({
  required String? name,
}) {
  if (name!.isEmpty) {
    return 'enterName'.tr();
  }
  return null;
}
