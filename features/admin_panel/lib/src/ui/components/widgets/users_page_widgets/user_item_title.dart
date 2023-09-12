import 'package:admin_panel/admin_panel.dart';
import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class UserItemTitle extends StatelessWidget {
  final UserInfoModel userInfoItem;

  const UserItemTitle({
    super.key,
    required this.userInfoItem,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final AuthBloc authBloc = context.read<AuthBloc>();
    final AdminPanelBloc adminPanelBloc = context.read<AdminPanelBloc>();
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: AppStyles.defaultBorderRadius,
        color: theme.cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              userInfoItem.userName,
              style: theme.textTheme.bodyLarge,
            ),
            Text(
              userInfoItem.email,
              style: theme.textTheme.titleMedium,
            ),
            authBloc.state.isDataProcessing
                ? const LoadingIndicator()
                : authBloc.state.userRole == AppConstants.userRoles[2]
                    ? CustomDropDownField(
                        listOfItems: AppConstants.userRoles,
                        value: userInfoItem.userRole,
                        onChanged: (String? value) {
                          adminPanelBloc.add(
                            ChangeUserRoleEvent(
                              userId: userInfoItem.userId,
                              newUserRoleValue: value ?? '',
                            ),
                          );
                          NotificationToast.showNotification(
                            context,
                            'userRoleChanged'.tr(),
                            mediaQueryData,
                            settingsBloc,
                            Icons.expand_circle_down_outlined,
                            theme.canvasColor,
                          );
                        },
                      )
                    : Column(
                        children: <Widget>[
                          SizedBox(height: mediaQueryData.size.height * 0.009),
                          Text(
                            userInfoItem.userRole,
                            style: theme.textTheme.displayMedium,
                          ),
                        ],
                      )
          ],
        ),
      ),
    );
  }
}
