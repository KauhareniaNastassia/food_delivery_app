import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SettingsPageContent extends StatelessWidget {
  const SettingsPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final ThemeData theme = Theme.of(context);
    final AuthBloc authBloc = context.read<AuthBloc>();

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
                  title:
                      state.isLight ? 'toDarkTheme'.tr() : 'toLightTheme'.tr(),
                  isLight: state.isLight,
                  onTap: () {
                    settingsBloc.add(
                      AppThemeChangingEvent(),
                    );
                  },
                ),
                const SizedBox(height: 5),
                ChangeColorScheme(
                  isStandardColorScheme: state.isStandardColorScheme,
                  title: 'changeColorScheme'.tr(),
                  onTap: () {
                    settingsBloc.add(
                      AppColorSchemeChangingEvent(),
                    );
                  },
                ),
                const SizedBox(height: 5),
                ChangeAppLanguage(
                  title: 'changeLanguage'.tr(),
                ),
                const SizedBox(height: 25),
                const ChangeFontSizeSlider(),
              ],
            ),
          ),
          bottomNavigationBar:
              authBloc.state.userRole == AppConstants.userRoles[0]
                  ? Material(
                      color: theme.scaffoldBackgroundColor,
                      child: const ContactLinksView(),
                    )
                  : null,
        );
      },
    );
  }
}
