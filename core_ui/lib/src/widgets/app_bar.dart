import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (BuildContext context, SettingsState state) {
        return AppBar(
          title: Text(
            appLocalization.translate('appTitle'),
          ),
          backgroundColor: theme.appBarTheme.backgroundColor,
          titleSpacing: theme.appBarTheme.titleSpacing,
          titleTextStyle: theme.appBarTheme.titleTextStyle,
          automaticallyImplyLeading: false,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
