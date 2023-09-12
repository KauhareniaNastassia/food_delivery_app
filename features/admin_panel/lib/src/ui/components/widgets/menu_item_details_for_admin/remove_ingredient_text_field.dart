import 'package:admin_panel/admin_panel.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RemoveIngredientTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback onPressed;

  const RemoveIngredientTextField({
    super.key,
    required this.textEditingController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Row(
      children: <Widget>[
        MenuItemTextField(
          label: 'ingredient'.tr(),
          textEditingController: textEditingController,
          width: mediaQueryData.size.width * 0.5,
          validation: (String? ingredient) {
            return menuItemIngredientValidation(ingredient ?? '');
          },
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.delete_outline_rounded),
        ),
      ],
    );
  }
}
