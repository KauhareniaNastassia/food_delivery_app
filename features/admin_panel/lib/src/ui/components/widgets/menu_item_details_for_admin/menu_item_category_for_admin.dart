import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MenuItemDetailsCategoryForAdmin extends StatelessWidget {
  final String category;
  final bool isEditMode;
  final Function(String?) onChange;

  const MenuItemDetailsCategoryForAdmin({
    super.key,
    required this.category,
    required this.isEditMode,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          isEditMode ? 'chooseCategory'.tr() : 'category'.tr(),
          style: theme.textTheme.bodyLarge,
        ),
        SizedBox(width: mediaQueryData.size.width * 0.07),
        isEditMode
            ? CustomDropDownField(
                listOfItems: AppConstants.menuItemCategory,
                value: category,
                onChanged: (String? value) {
                  onChange(value);
                })
            : Text(
                category,
                style: theme.textTheme.titleLarge,
              ),
      ],
    );
  }
}
