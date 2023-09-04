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

String? menuItemTitleValidation({
  required String? title,
}) {
  if (title!.isEmpty) {
    return 'titleIsRequired'.tr();
  }
  if (title.length > 25) {
    return 'titleShouldBeShorter'.tr();
  }
  return null;
}

String? menuItemCostValidation({
  required String? cost,
}) {
  if (cost!.isEmpty) {
    return 'costIsRequired'.tr();
  }
  if (cost.split('.').last.length > 2) {
    return 'numbersAfterDot'.tr();
  }
  return null;
}

String? menuItemDescriptionValidation({
  required String? description,
}) {
  if (description!.isEmpty) {
    return 'descriptionIsRequired'.tr();
  }
  if (description.length > 500) {
    return 'longDescription'.tr();
  }
  return null;
}

String? menuItemIngredientValidation({
  required String? ingredient,
}) {
  if (ingredient!.isEmpty) {
    return 'ingredientIsRequired'.tr();
  }
  if (ingredient.length > 20) {
    return 'longIngredient'.tr();
  }
  return null;
}
