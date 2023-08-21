import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class AddToCartButton extends StatelessWidget {
  final VoidCallback onPressed;
  final int? amount;

  const AddToCartButton({
    required this.onPressed,
    required this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            amount != null ? theme.canvasColor : theme.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Text(
          amount != null
              ? '$amount ${'inCart'.tr()}'
              :'addToCart'.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyles.size22WeightSemiBoldText(
            fontSize: settingsBloc.state.fontSize,
            color: AppColors.primaryButtonTextColor,
          ),
        ),
      ),
    );
  }
}
