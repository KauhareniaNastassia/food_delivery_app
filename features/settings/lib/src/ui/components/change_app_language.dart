import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ChangeAppLanguage extends StatelessWidget {
  final String title;

  const ChangeAppLanguage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: theme.textTheme.titleLarge,
        ),
        CustomSwitcher(
          toggle: context.locale == const Locale('en'),
          onTap: () {
            context.locale == const Locale('en')
                ? context.setLocale(
                    const Locale('es'),
                  )
                : context.setLocale(
                    const Locale('en'),
                  );
          },
        )
      ],
    );
  }
}
