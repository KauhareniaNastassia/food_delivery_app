import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class NothingFindInCategory extends StatelessWidget {
  const NothingFindInCategory({super.key});

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
            height: mediaQueryData.size.height / 2.3,
            child: RiveAsset(
              riveAnimationPath: AnimationPathConstants.nothingInCategoryPath,
            ),
          ),
          Text(
            appLocalization.translate('nothingInCategory'),
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
