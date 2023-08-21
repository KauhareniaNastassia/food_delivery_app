import 'package:core/core.dart';
import 'package:flutter/material.dart';

class NothingFindInCategory extends StatelessWidget {
  const NothingFindInCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);

    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: mediaQueryData.size.width / 1.3,
            height: mediaQueryData.size.height / 2.3,
            child: RiveAnimation.asset(
                AnimationPathConstants.nothingInCategoryPath),
          ),
          Text(
            'nothingInCategory'.tr(),
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
