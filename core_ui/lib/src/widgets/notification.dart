import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class NotificationToast {
  static void showNotification(
    BuildContext context,
    String message,
    MediaQueryData mediaQueryData,
    SettingsBloc settingsBloc,
    IconData icon,
    Color color,
  ) {
    MotionToast(
      icon: icon,
      description: Text(
        message,
        style: AppTextStyles.size18WeightSemiBoldText(
          fontSize: settingsBloc.state.fontSize,
          color: AppColors.primaryColor,
        ),
        textAlign: TextAlign.center,
      ),
      toastDuration: const Duration(seconds: 2),
      width: mediaQueryData.size.width * 0.9,
      height: mediaQueryData.size.height * 0.09,
      displayBorder: false,
      displaySideBar: false,
      iconSize: mediaQueryData.size.width * 0.12,
      primaryColor: color,
    ).show(context);
  }
}
