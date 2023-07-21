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
    final Size size = MediaQuery.sizeOf(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: size.height / 6,
        width: size.width / 1.2,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: AppStyles.largeBorderRadius,
          color: Theme.of(context).cardColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: size.width / 2,
            padding: const EdgeInsets.only(left: 40),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 40),
                Text(
                  '\$$cost',
                  style: AppTextStyles.size22WeightSemiBoldText(
                    fontSize: settingsBloc.state.fontSize,
                    color: Theme.of(context).primaryColor,
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
