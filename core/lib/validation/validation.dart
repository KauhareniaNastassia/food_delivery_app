import 'dart:core';

import 'package:core/core.dart';

String? emailValidation(String email) {
  if (email.isEmpty) {
    return 'enterEmail'.tr();
  }
  if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(email)) {
    return 'enterValidEmail'.tr();
  }
  return null;
}

String? passwordValidation(String password) {
  if (password.isEmpty) {
    return 'enterPassword'.tr();
  }
  if (password.length < AppConstants.passwordLength) {
    return 'shortPassword'.tr();
  }
  return null;
}

String? nameValidation(String name) {
  if (name.isEmpty) {
    return 'enterName'.tr();
  }
  return null;
}

String? menuItemTitleValidation(String title) {
  if (title.isEmpty) {
    return 'titleIsRequired'.tr();
  }
  if (title.length > AppConstants.menuItemTitleLength) {
    return 'titleShouldBeShorter'.tr();
  }
  return null;
}

String? menuItemCostValidation(String cost) {
  if (cost.isEmpty) {
    return 'costIsRequired'.tr();
  }
  if (cost.split('.').last.length > AppConstants.numbersAfterDot) {
    return 'numbersAfterDot'.tr();
  }
  return null;
}

String? menuItemDescriptionValidation(String description) {
  if (description.isEmpty) {
    return 'descriptionIsRequired'.tr();
  }
  if (description.length > AppConstants.descriptionLength) {
    return 'longDescription'.tr();
  }
  return null;
}

String? menuItemIngredientValidation(String ingredient) {
  if (ingredient.isEmpty) {
    return 'ingredientIsRequired'.tr();
  }
  if (ingredient.length > AppConstants.ingredientLength) {
    return 'longIngredient'.tr();
  }
  return null;
}

String? newCategoryValidation({
  required String newCategory,
  required String categoryFromDropDown,
}) {
  if (newCategory.length > AppConstants.categoryLength) {
    return 'longCategory'.tr();
  }
  if (categoryFromDropDown == AppConstants.noCategory && newCategory.isEmpty) {
    return 'enterOrChooseCategory'.tr();
  }
  return null;
}
