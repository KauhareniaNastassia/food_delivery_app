import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../../shopping_cart.dart';

class SwitchForCutlery extends StatelessWidget {
  final bool switchValue;

  const SwitchForCutlery({
    super.key,
    required this.switchValue,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SizedBox(
        height: size.height / 20,
        child: SwitchListTile(
          dense: false,
          value: switchValue,
          title: Text(
            'Do you need cutlery?',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          activeColor: Theme.of(context).primaryColor,
          inactiveThumbColor: Theme.of(context).disabledColor,
          inactiveTrackColor: AppColors.backgroundItemColor,
          onChanged: (bool newValue) {
            context.read<ShoppingCartBloc>().add(
                  AddCutleryEvent(),
                );
          },
        ),
      ),
    );
  }
}
