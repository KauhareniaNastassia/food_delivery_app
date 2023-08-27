import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          settingsBloc.state.fontSize > 1 && userName.length > 19
              ? '${userName.substring(0, 16)}...'
              : settingsBloc.state.fontSize <= 1 && userName.length > 25
                  ? '${userName.substring(0, 23)}...'
                  : userName,
          style: theme.textTheme.titleLarge,
        ),
        userRole == AppConstants.userRoles[0]
            ? SizedBox(height: 10 * settingsBloc.state.fontSize)
            : Column(
                children: <Widget>[
                  SizedBox(height: 3 * settingsBloc.state.fontSize),
                  Text(
                    userRole,
                    style: settingsBloc.state.fontSize > 1
                        ? AppTextStyles.size13WeightSemiBoldText(
                            color: AppColors.titleDarkGreyTextColor,
                            fontSize: settingsBloc.state.fontSize,
                          )
                        : AppTextStyles.size15WeightSemiBoldText(
                            color: AppColors.titleDarkGreyTextColor,
                            fontSize: settingsBloc.state.fontSize,
                          ),
                  ),
                  SizedBox(height: 5 * settingsBloc.state.fontSize),
                ],
              ),
        Text(
          settingsBloc.state.fontSize > 1 && email.length > 21
              ? '${email.substring(0, 19)}...'
              : settingsBloc.state.fontSize <= 1 && email.length > 25
                  ? '${email.substring(0, 22)}...'
                  : email,
          style: settingsBloc.state.fontSize > 1
              ? AppTextStyles.size13WeightSemiBoldText(
                  color: AppColors.titleDarkGreyTextColor,
                  fontSize: settingsBloc.state.fontSize,
                )
              : AppTextStyles.size15WeightSemiBoldText(
                  color: AppColors.titleDarkGreyTextColor,
                  fontSize: settingsBloc.state.fontSize,
                ),
        ),
      ],
    );
  }
}
