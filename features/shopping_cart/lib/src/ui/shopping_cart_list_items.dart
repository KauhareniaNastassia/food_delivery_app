import 'package:core_ui/core_ui.dart';
import 'package:domain/models/shopping_cart_model/shopping_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
import 'package:shopping_cart/src/ui/shopping_cart_item.dart';

class ShoppingCartListItems extends StatelessWidget {
  final ShoppingCartModel shoppingCart;

  const ShoppingCartListItems({
    Key? key,
    required this.shoppingCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: shoppingCart.shoppingCartItems.length,
      itemBuilder: (context, index) {
        return OpenContainer(
          closedElevation: 0.0,
          transitionDuration: const Duration(milliseconds: 600),
          closedBuilder: (context, action) {
            return ShoppingCartItem(
              key: ValueKey(
                shoppingCart.shoppingCartItems[index].menuItem.id,
              ),
              shoppingCartItem: shoppingCart.shoppingCartItems[index],
              onTap: action,
            );
          },
          openBuilder: (context, action) {
            return MenuItemDetailsScreen(
              menuItem: shoppingCart.shoppingCartItems[index].menuItem,
            );
          },
        );
      },
    );
  }
}
