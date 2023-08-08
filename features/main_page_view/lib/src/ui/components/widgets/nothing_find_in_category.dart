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
            width: mediaQueryData.size.width / 2.5,
            height: mediaQueryData.size.height / 2.5,
            child: Image.asset(
              'assets/image/nothing_in_category.png',
            ),
          ),
          Text(
            AppConstants.nothingInCategory,
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
