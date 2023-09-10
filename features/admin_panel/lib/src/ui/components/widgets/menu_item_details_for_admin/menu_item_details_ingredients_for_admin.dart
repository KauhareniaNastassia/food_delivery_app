import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel/admin_panel.dart';

class MenuItemDetailsIngredientsForAdmin extends StatelessWidget {
  final List<String> ingredients;
  final bool isEditMode;
  final List<TextEditingController> listOfIngredientControllers;
  final void Function(TextEditingController) addIngredientController;
  final void Function(int) removeIngredientController;

  const MenuItemDetailsIngredientsForAdmin({
    super.key,
    required this.ingredients,
    required this.isEditMode,
    required this.listOfIngredientControllers,
    required this.addIngredientController,
    required this.removeIngredientController,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'ingredients'.tr(),
          style: theme.textTheme.bodyMedium,
        ),
        SizedBox(height: mediaQueryData.size.height * 0.01),
        isEditMode
            ? AddIngredientTextField(
                addIngredientController: addIngredientController,
              )
            : const SizedBox(),
        ingredients.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: isEditMode
                    ? listOfIngredientControllers.length
                    : ingredients.length,
                padding: const EdgeInsets.all(0),
                itemBuilder: (_, index) {
                  return Row(
                    children: <Widget>[
                      SizedBox(width: mediaQueryData.size.width * 0.03),
                      const CustomDotPoint(),
                      SizedBox(width: mediaQueryData.size.width * 0.03),
                      isEditMode
                          ? RemoveIngredientTextField(
                              textEditingController:
                                  listOfIngredientControllers[index],
                              onPressed: () {
                                removeIngredientController(index);
                              },
                            )
                          : Text(
                              ingredients[index],
                              style: theme.textTheme.titleSmall,
                            ),
                    ],
                  );
                },
              )
            : isEditMode
                ? const SizedBox()
                : Center(
                    child: Text(
                      'noIngredients'.tr(),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
      ],
    );
  }
}
