import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SignTitle extends StatelessWidget {
  final String title;

  const SignTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Image.asset(
            "assets/image/logo.png",
            width: mediaQueryData.size.width * 0.4,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          title,
          style: AppTextStyles.size24WeightBoldText(
            fontSize: settingsBloc.state.fontSize,
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}
