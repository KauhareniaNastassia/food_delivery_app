import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class MenuItemTitle extends StatelessWidget {
  final String title;
  final double cost;

  const MenuItemTitle({
    super.key,
    required this.title,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final ThemeData theme = Theme.of(context);

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: mediaQueryData.size.height / 6,
        width: mediaQueryData.size.width / 1.2,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: AppStyles.largeBorderRadius,
          color: theme.cardColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: mediaQueryData.size.width / 2,
            padding: const EdgeInsets.fromLTRB(40, 10, 0, 10),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: theme.textTheme.titleLarge,
                ),
                Text(
                  '\$$cost',
                  style: AppTextStyles.size22WeightSemiBoldText(
                    fontSize: settingsBloc.state.fontSize,
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
