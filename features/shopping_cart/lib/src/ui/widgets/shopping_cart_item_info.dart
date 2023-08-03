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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title.length > 17 ? '${title.substring(0, 14)}...' : title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '\$$cost',
              style: AppTextStyles.size16WeightSemiBoldText(
                fontSize: settingsBloc.state.fontSize,
                color: Theme.of(context).primaryColor,
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
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
