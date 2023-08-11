import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class ChangeAppLanguage extends StatelessWidget {
  const ChangeAppLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          settingsBloc.state.isEnglishLanguage
              ? appLocalization.translate('changeToSpanish')
              : appLocalization.translate('changeToEnglish'),
          style: theme.textTheme.titleLarge,
        ),
        CustomSwitcher(
          toggle: settingsBloc.state.isEnglishLanguage,
          onTap: () {
            settingsBloc.add(
              LanguageEvent(),
            );
          },
        )
      ],
    );
  }
}
