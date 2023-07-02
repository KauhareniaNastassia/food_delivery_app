import 'package:flutter/material.dart';

import '../../core_ui.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isPressed;
  final Function toggleButton;

  const CustomAppBar(
      {Key? key, required this.isPressed, required this.toggleButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Food Delivery App'),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      titleSpacing: Theme.of(context).appBarTheme.titleSpacing,
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Icon(
              isPressed
                  ? Icons.brightness_2_outlined
                  : Icons.brightness_4_rounded,
            ),
            color: AppColors.backgroundColor,
            onPressed: () {
              toggleButton();
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
