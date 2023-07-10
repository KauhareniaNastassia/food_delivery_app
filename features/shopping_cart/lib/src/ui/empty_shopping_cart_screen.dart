import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation/navigation.dart';

class EmptyShoppingCartScreen extends StatelessWidget {
  const EmptyShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

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
            onPressed: () {
              context.navigateTo(
                const MainPageRoute(),
              );
            },
          ),
        ],
      ),
    );
  }
}
