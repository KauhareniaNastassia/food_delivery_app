import 'package:core/core.dart';
import 'package:flutter/material.dart';

class PageRefresher extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const PageRefresher({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return LiquidPullToRefresh(
      showChildOpacityTransition: false,
      springAnimationDurationInMilliseconds: 1000,
      animSpeedFactor: 10,
      key: const ValueKey<int>(1),
      color: theme.primaryColor,
      height: size.height / 20,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
