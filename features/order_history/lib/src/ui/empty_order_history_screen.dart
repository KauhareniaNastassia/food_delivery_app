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
            height: mediaQueryData.size.height / 11.5,
          ),
          SizedBox(
            width: mediaQueryData.size.width / 2.5,
            height: mediaQueryData.size.height / 2.5,
            child: Image.asset(
              'assets/image/empty_order_history.png',
            ),
          ),
          Text(
            appLocalization.translate('noOrdersMessage'),
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          PrimaryButton(
            buttonTitle: appLocalization.translate('goToCart'),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
