import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class CompleteOrderItemButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonTitle;

  const CompleteOrderItemButton({
    required this.onPressed,
    required this.buttonTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(

        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        backgroundColor: theme.canvasColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      child: Text(
        buttonTitle,
        textAlign: TextAlign.center,
        style: AppTextStyles.size16WeightSemiBoldText(
          fontSize: settingsBloc.state.fontSize,
          color: AppColors.primaryButtonTextColor,
        ),
      ),
    );
  }
}
