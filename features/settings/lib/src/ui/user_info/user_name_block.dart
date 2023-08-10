import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class UserNameBlock extends StatelessWidget {
  final String userName;
  final String email;

  const UserNameBlock({
    super.key,
    required this.userName,
    required this.email,
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
          userName,
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 10 * settingsBloc.state.fontSize),
        Text(
          email,
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
