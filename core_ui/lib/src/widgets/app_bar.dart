import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (BuildContext context, SettingsState state) {
        return AppBar(
          title: const Text('Food Delivery App'),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          titleSpacing: Theme.of(context).appBarTheme.titleSpacing,
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
