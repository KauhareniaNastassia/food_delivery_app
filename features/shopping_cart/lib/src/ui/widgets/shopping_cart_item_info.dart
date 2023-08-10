import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class ShoppingCartItemInfo extends StatelessWidget {
  final String title;
  final double cost;
  final int amount;

  const ShoppingCartItemInfo({
    super.key,
    required this.title,
    required this.cost,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              settingsBloc.state.fontSize > 1 && title.length > 16
                  ? '${title.substring(0, 13)}...'
                  : settingsBloc.state.fontSize <= 1 && title.length > 19
                      ? '${title.substring(0, 17)}...'
                      : title,
              style: theme.textTheme.bodySmall,
            ),
            Text(
              '\$$cost',
              style: AppTextStyles.size16WeightSemiBoldText(
                fontSize: settingsBloc.state.fontSize,
                color: theme.primaryColor,
              ),
            ),
          ],
        ),
        Text(
          '\$${double.parse(
            (cost * amount).toStringAsFixed(2),
          )}',
          style: AppTextStyles.size16WeightSemiBoldText(
            fontSize: settingsBloc.state.fontSize,
            color: theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
