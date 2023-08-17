import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class EmptyOrderHistoryScreen extends StatelessWidget {
  final VoidCallback onPressed;

  const EmptyOrderHistoryScreen({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    final AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: mediaQueryData.size.width / 1.3,
            height: mediaQueryData.size.height / 2.1,
            child: const RiveAnimation.asset(
              'assets/image/rive_icons/empty_order_history.riv',
            ),
          ),
          Text(
            appLocalization.translate('noOrdersMessage'),
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            buttonTitle: appLocalization.translate('goToCart'),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
