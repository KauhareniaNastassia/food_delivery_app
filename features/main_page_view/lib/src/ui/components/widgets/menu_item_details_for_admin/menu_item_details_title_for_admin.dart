import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';

class MenuItemDetailsTitleForAdmin extends StatelessWidget {
  final String title;
  final String cost;
  final bool isEditMode;
  final TextEditingController titleController;
  final TextEditingController costController;

  const MenuItemDetailsTitleForAdmin({
    super.key,
    required this.title,
    required this.cost,
    required this.isEditMode,
    required this.titleController,
    required this.costController,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        isEditMode
            ? MenuItemTextField(
                label: 'title'.tr(),
                textEditingController: titleController,
                width: mediaQueryData.size.width * 0.5,
                validation: (String? title) {
                  return menuItemTitleValidation(title: title);
                },
              )
            : Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleLarge,
                ),
              ),
        isEditMode
            ? MenuItemTextField(
                label: 'cost'.tr(),
                width: mediaQueryData.size.width * 0.2,
                textEditingController: costController,
                keyboardType: TextInputType.number,
                validation: (String? cost) {
                  return menuItemCostValidation(cost: cost);
                },
              )
            : Text(
                '\$$cost',
                style: theme.textTheme.titleMedium,
              ),
      ],
    );
  }
}
