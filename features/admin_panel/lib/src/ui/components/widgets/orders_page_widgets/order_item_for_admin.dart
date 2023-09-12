import 'package:admin_panel/admin_panel.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';

class OrderItemForAdmin extends StatelessWidget {
  final OrderItemForAdminModel orderItemForAdmin;

  const OrderItemForAdmin({
    super.key,
    required this.orderItemForAdmin,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AdminPanelBloc adminPanelBloc = context.read<AdminPanelBloc>();
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: AppStyles.defaultBorderRadius,
        color: theme.cardColor,
      ),
      child: ExpansionTile(
        title: OrderItemForAdminTitle(
          userEmail: orderItemForAdmin.email,
          date: orderItemForAdmin.orderItem.date,
          isCompleted: orderItemForAdmin.orderItem.isCompleted,
          onPressed: () {
            adminPanelBloc.add(
              ChangeOrderStatusEvent(
                userId: orderItemForAdmin.userId,
                orderId: orderItemForAdmin.orderItem.id,
              ),
            );
            NotificationToast.showNotification(
              context,
              'orderIsCompleted'.tr(),
              mediaQueryData,
              settingsBloc,
              Icons.expand_circle_down_outlined,
              theme.canvasColor,
            );
          },
        ),
        children: <Widget>[
          OrderItemForAdminContent(
            orderedShoppingCart: orderItemForAdmin.orderItem.shoppingCart,
          ),
        ],
      ),
    );
  }
}
