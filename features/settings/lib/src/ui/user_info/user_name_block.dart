import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class UserNameBlock extends StatelessWidget {
  final String userName;
  final String email;
  final String userRole;

  const UserNameBlock({
    super.key,
    required this.userName,
    required this.email,
    required this.userRole,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: mediaQueryData.size.width / 1.9,
          child: SizedOverflowBox(
            alignment: Alignment.bottomLeft,
            size: mediaQueryData.size * 0.015,
            child: Text(
              userName,
              style: theme.textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        userRole == AppConstants.userRoles[0]
            ? SizedBox(height: 10 * settingsBloc.state.fontSize)
            : Column(
                children: <Widget>[
                  SizedBox(height: 3 * settingsBloc.state.fontSize),
                  Text(
                    userRole,
                    style: theme.textTheme.displayLarge,
                  ),
                  SizedBox(height: 5 * settingsBloc.state.fontSize),
                ],
              ),
        SizedBox(height: mediaQueryData.size.height * 0.01),
        SizedBox(
          width: mediaQueryData.size.width / 1.9,
          child: SizedOverflowBox(
            alignment: Alignment.bottomLeft,
            size: mediaQueryData.size * 0.015,
            child: Text(
              email,
              style: theme.textTheme.displayLarge,
            ),
          ),
        ),
      ],
    );
  }
}
