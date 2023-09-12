import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MenuItemDetailsBottomBarForAdmin extends StatelessWidget {
  final VoidCallback onPressedSave;
  final VoidCallback onPressedEditMode;
  final VoidCallback onPressCancel;
  final bool isEditingMode;

  const MenuItemDetailsBottomBarForAdmin({
    super.key,
    required this.onPressedSave,
    required this.onPressCancel,
    required this.isEditingMode,
    required this.onPressedEditMode,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Material(
      color: theme.cardColor,
      child: Container(
        padding: EdgeInsets.only(
          left: mediaQueryData.size.width * 0.04,
          right: mediaQueryData.size.width * 0.04,
          bottom: mediaQueryData.size.height * 0.02,
        ),
        child: isEditingMode
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  PrimaryButton(
                    buttonTitle: 'cancel'.tr(),
                    onPressed: onPressCancel,
                  ),
                  PrimaryButton(
                    buttonTitle: 'saveItem'.tr(),
                    onPressed: onPressedSave,
                  ),
                ],
              )
            : PrimaryButton(
                buttonTitle: 'editItem'.tr(),
                onPressed: onPressedEditMode,
              ),
      ),
    );
  }
}
