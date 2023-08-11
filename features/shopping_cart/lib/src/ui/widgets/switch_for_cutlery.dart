import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'package:shopping_cart/shopping_cart.dart';

class SwitchForCutlery extends StatelessWidget {
  final bool switchValue;

  const SwitchForCutlery({
    super.key,
    required this.switchValue,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ShoppingCartBloc shoppingCartBloc = context.read<ShoppingCartBloc>();
    final ThemeData theme = Theme.of(context);
    final AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SizedBox(
        height: size.height / 20,
        child: SwitchListTile(
          dense: false,
          value: switchValue,
          title: Text(
            appLocalization.translate('needCutlery'),
            style: theme.textTheme.titleLarge,
          ),
          activeColor: theme.primaryColor,
          inactiveThumbColor: theme.disabledColor,
          inactiveTrackColor: AppColors.backgroundItemColor,
          onChanged: (bool newValue) {
            shoppingCartBloc.add(
              AddCutleryEvent(),
            );
          },
        ),
      ),
    );
  }
}
