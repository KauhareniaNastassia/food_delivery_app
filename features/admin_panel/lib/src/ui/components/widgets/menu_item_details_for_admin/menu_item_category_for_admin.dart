import 'package:admin_panel/admin_panel.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MenuItemDetailsCategoryForAdmin extends StatelessWidget {
  final TextEditingController categoryController;
  final bool isEditMode;
  final Function(String?) onChange;
  final List<String> menuItemCategories;
  final TextEditingController newCategoryController;

  const MenuItemDetailsCategoryForAdmin({
    super.key,
    required this.categoryController,
    required this.isEditMode,
    required this.onChange,
    required this.menuItemCategories,
    required this.newCategoryController,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              isEditMode ? 'chooseCategory'.tr() : 'category'.tr(),
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(width: mediaQueryData.size.width * 0.07),
            isEditMode
                ? Column(
                    children: [
                      CustomDropDownField(
                        listOfItems: menuItemCategories,
                        value: newCategoryController.text.isEmpty
                            ? categoryController.text
                            : AppConstants.noCategory,
                        onChanged: (String? value) {
                          newCategoryController.clear();
                          onChange(value);
                        },
                      ),
                    ],
                  )
                : Text(
                    newCategoryController.text.isEmpty
                        ? categoryController.text
                        : newCategoryController.text,
                    style: theme.textTheme.titleLarge,
                  ),
          ],
        ),
        isEditMode
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'orWrite'.tr(),
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(width: mediaQueryData.size.width * 0.07),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.55,
                    child: MenuItemTextField(
                      label: 'newCategory'.tr(),
                      textEditingController: newCategoryController,
                      width: mediaQueryData.size.width * 0.5,
                      validation: (String? category) {
                        return newCategoryValidation(
                          newCategory: newCategoryController.text,
                          categoryFromDropDown: categoryController.text,
                        );
                      },
                    ),
                  ),
                ],
              )
            : const SizedBox()
      ],
    );
  }
}
