import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';

import '../../core_ui.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (BuildContext context, AppThemeState state) {
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
                  state.isLight
                      ? Icons.brightness_4_rounded
                      : Icons.brightness_2_outlined,
                ),
                color: AppColors.backgroundColor,
                onPressed: () {
                  context.read<AppThemeBloc>().add(
                        AppThemeChangingEvent(),
                      );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
