import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:order_history/order_history.dart';

class OrderItemForAdminContent extends StatelessWidget {
  final ShoppingCartModel orderedShoppingCart;

  const OrderItemForAdminContent({
    super.key,
    required this.orderedShoppingCart,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return SizedBox(
      width: mediaQueryData.size.width * 0.87,
      child: Column(
        children: <Widget>[
          ListOfOrderedMenuItems(
            orderedItems: orderedShoppingCart.shoppingCartItems,
            addedCutlery: orderedShoppingCart.addCutlery,
          ),
          SizedBox(height: mediaQueryData.size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'totalPrice'.tr(),
                style: theme.textTheme.titleMedium,
              ),
              Text(
                '\$${orderedShoppingCart.totalPrice.toStringAsFixed(2)}',
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
          SizedBox(height: mediaQueryData.size.height * 0.01),
        ],
      ),
    );
  }
}
