import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel/admin_panel.dart';

class MenuItemDetailsDescriptionForAdmin extends StatelessWidget {
  final String description;
  final bool isEditMode;
  final TextEditingController descriptionController;

  const MenuItemDetailsDescriptionForAdmin({
    super.key,
    required this.description,
    required this.isEditMode,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);

    return Column(
      children: <Widget>[
        isEditMode
            ? MenuItemTextField(
                label: 'description'.tr(),
                textEditingController: descriptionController,
                width: mediaQueryData.size.width * 0.9,
                maxLines: null,
                validation: (String? description) {
                  return menuItemDescriptionValidation(description ?? '');
                },
              )
            : description.isNotEmpty
                ? Text(
                    description,
                    style: theme.textTheme.titleSmall,
                  )
                : Center(
                    child: Text(
                      'noDescription'.tr(),
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
      ],
    );
  }
}
