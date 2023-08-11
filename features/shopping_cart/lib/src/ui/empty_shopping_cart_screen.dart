import 'package:core/localization/app_localizations.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyShoppingCartScreen extends StatelessWidget {
  final VoidCallback onPressed;

  const EmptyShoppingCartScreen({
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
            child: SvgPicture.asset(
              'assets/image/nothing_founded_icon.svg',
            ),
          ),
          Text(
            appLocalization.translate('nothingInCart'),
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          PrimaryButton(
            buttonTitle: appLocalization.translate('goToMenu'),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
