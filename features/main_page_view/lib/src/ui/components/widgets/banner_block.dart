import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class BannerBlock extends StatelessWidget {
  const BannerBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    final AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return Ink(
      width: mediaQueryData.size.width * 0.95,
      height: mediaQueryData.size.height * 0.14,
      decoration: BoxDecoration(
        borderRadius: AppStyles.defaultBorderRadius,
        boxShadow: [AppStyles.boxShadow],
        color: theme.cardColor,
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: mediaQueryData.size.width * 0.5,
              child: Text(
                appLocalization.translate('delivery'),
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: -23,
            child: SizedBox(
              height: mediaQueryData.size.height * 0.2,
              width: mediaQueryData.size.width * 0.35,
              child: RiveAsset(
                riveAnimationPath:
                    AnimationPathConstants.shoppingCartBannerPath,
              ),
            ),
          )
        ],
      ),
    );
  }
}
