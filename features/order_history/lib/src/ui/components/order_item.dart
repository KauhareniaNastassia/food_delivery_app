import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:order_history/order_history.dart';

class OrderItem extends StatelessWidget {
  final OrderItemModel orderItem;

  const OrderItem({
    super.key,
    required this.orderItem,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return Ink(
      decoration: BoxDecoration(
        borderRadius: AppStyles.mediumBorderRadius,
        boxShadow: [AppStyles.boxShadow],
        color: theme.cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${appLocalization.translate('numberOfOrder')}'
                  '${orderItem.id}',
                  style: theme.textTheme.bodyLarge,
                ),
                Text(
                  '\$${orderItem.shoppingCart.totalPrice.toStringAsFixed(2)}',
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
            SizedBox(height: mediaQueryData.size.height * 0.01),
            ListOfOrderedMenuItems(
              orderedItems: orderItem.shoppingCart.shoppingCartItems,
              addedCutlery: orderItem.shoppingCart.addCutlery,
            ),
            SizedBox(height: mediaQueryData.size.height * 0.01),
            Text(
              '${appLocalization.translate('orderedOn')} '
              '${DateFormatter().formatDateString(orderItem.date)}',
              style: theme.textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
