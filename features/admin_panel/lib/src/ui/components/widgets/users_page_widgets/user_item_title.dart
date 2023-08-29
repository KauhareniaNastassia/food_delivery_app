import 'package:admin_panel/admin_panel.dart';
import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

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
                    ? ChangeUserRoleField(
                        userRole: userInfoItem.userRole,
                        onChanged: (String? value) {
                          adminPanelBloc.add(
                            ChangeUserRoleEvent(
                              userId: userInfoItem.userId,
                              newUserRoleValue: value!,
                            ),
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
