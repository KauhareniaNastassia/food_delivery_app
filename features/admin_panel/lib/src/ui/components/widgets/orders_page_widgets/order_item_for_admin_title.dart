import 'package:admin_panel/admin_panel.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class OrderItemForAdminTitle extends StatelessWidget {
  final String userEmail;
  final String date;
  final bool isCompleted;
  final VoidCallback onPressed;

  const OrderItemForAdminTitle({
    super.key,
    required this.userEmail,
    required this.date,
    required this.isCompleted,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          userEmail,
          style: theme.textTheme.bodyLarge,
        ),
        Text(
          DateFormatter().formatDateString(date),
          style: theme.textTheme.titleSmall,
        ),
        isCompleted
            ? Column(
                children: <Widget>[
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: theme.canvasColor,
                      ),
                      SizedBox(width: mediaQueryData.size.width * 0.01),
                      Text(
                        'orderIsCompleted'.tr(),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  )
                ],
              )
            : Column(
                children: <Widget>[
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  CompleteOrderItemButton(
                    buttonTitle: 'completeOrder'.tr(),
                    onPressed: onPressed,
                  )
                ],
              )
      ],
    );
  }
}
