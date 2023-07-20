import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SettingsPageContent extends StatelessWidget {
  const SettingsPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (BuildContext context, SettingsState state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SwitchToTheme(
                  isLight: state.isLight,
                  onTap: () {
                    context.read<SettingsBloc>().add(
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
                    context.read<SettingsBloc>().add(
                          AppColorSchemeChangingEvent(),
                        );
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: const ContactLinksView(),
          ),
        );
      },
    );
  }
}
