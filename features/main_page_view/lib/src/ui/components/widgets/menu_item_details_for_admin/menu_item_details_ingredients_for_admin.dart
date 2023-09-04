import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'ingredients'.tr(),
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 10),
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
                      const SizedBox(width: 15),
                      const CustomDotPoint(),
                      const SizedBox(width: 10),
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
