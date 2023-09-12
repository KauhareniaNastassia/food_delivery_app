import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';

class MenuItemDetailsImageForAdmin extends StatelessWidget {
  final String image;
  final bool isEditMode;
  final bool isNewImageUploaded;
  final VoidCallback onPressed;
  final VoidCallback onPressedAddNewImage;

  const MenuItemDetailsImageForAdmin({
    super.key,
    required this.image,
    required this.isNewImageUploaded,
    required this.isEditMode,
    required this.onPressed,
    required this.onPressedAddNewImage,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);

    return SliverAppBar(
      leading: BackToPreviousPageButton(
        onPressed: onPressed,
      ),
      expandedHeight: mediaQueryData.size.height * 0.4,
      flexibleSpace: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          FlexibleSpaceBar(
            background: MenuItemDetailsImage(
              image: image,
            ),
          ),
          isEditMode
              ? Padding(
                  padding: EdgeInsets.only(
                    right: mediaQueryData.size.width * 0.02,
                    bottom: mediaQueryData.size.height * 0.03,
                  ),
                  child: ElevatedButton(
                    onPressed: onPressedAddNewImage,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: AppStyles.defaultBorderRadius,
                          side: BorderSide(
                            color: theme.canvasColor,
                            width: mediaQueryData.size.width * 0.005,
                          ),
                        ),
                      ),
                    ),
                    child: Text(
                      isNewImageUploaded
                          ? 'addNewImage'.tr()
                          : 'newImageIsAdded'.tr(),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                )
              : const SizedBox(),
          const DecorationBlock(),
        ],
      ),
    );
  }
}
