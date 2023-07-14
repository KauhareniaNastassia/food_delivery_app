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
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: size.width / 2.5,
            height: size.height / 2.5,
            child: SvgPicture.asset(
              'assets/image/nothing_founded_icon.svg',
            ),
          ),
          Text(
            'Oops, there is nothing here yet',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          PrimaryButton(
            buttonTitle: 'Go to menu',
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
