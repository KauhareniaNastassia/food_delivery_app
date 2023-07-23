import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class ChangeFontSizeSlider extends StatelessWidget {
  const ChangeFontSizeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Change app font size',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Slider(
          value: settingsBloc.state.fontSize,
          min: 0.8,
          max: 1.2,
          divisions: 4,
          activeColor: theme.primaryColor,
          inactiveColor: theme.canvasColor,
          onChanged: (value) {
            settingsBloc.add(
              AppFontSizeChangingEvent(fontSize: value),
            );
          },
        ),
      ],
    );
  }
}
