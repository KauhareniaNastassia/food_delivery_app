import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SettingsPageContent extends StatelessWidget {
  const SettingsPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (BuildContext context, SettingsState state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const UserInfoBlock(),
                const SizedBox(height: 30),
                SwitchToTheme(
                  isLight: state.isLight,
                  onTap: () {
                    settingsBloc.add(
                      AppThemeChangingEvent(),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ChangeColorScheme(
                  isStandardColorScheme: state.isStandardColorScheme,
                  onTap: () {
                    settingsBloc.add(
                      AppColorSchemeChangingEvent(),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const ChangeFontSizeSlider(),
              ],
            ),
          ),
          bottomNavigationBar: Material(
            color: theme.scaffoldBackgroundColor,
            child: const ContactLinksView(),
          ),
        );
      },
    );
  }
}
