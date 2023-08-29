import 'package:core/core.dart';
import 'package:flutter/material.dart';

class NothingFindScreen extends StatelessWidget {
  final String riveAnimationPath;
  final String title;

  const NothingFindScreen({
    super.key,
    required this.riveAnimationPath,
    required this.title,
  });

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
            child: RiveAnimation.asset(riveAnimationPath),
          ),
          Text(
            title,
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
