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

    return Center(
      child: Column(
        children: <Widget>[
          NothingFindScreen(
            riveAnimationPath: AnimationPathConstants.emptyOrderHistoryPath,
            title: 'noOrdersMessage'.tr(),
          ),
          SizedBox(height: mediaQueryData.size.height * 0.025),
          PrimaryButton(
            buttonTitle: 'goToCart'.tr(),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
