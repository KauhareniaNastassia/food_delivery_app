import 'package:core/core.dart';
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
      itemBuilder: (_, int index) {
        return OpenContainer(
          closedElevation: 0.0,
          openElevation: 0.0,
          transitionDuration: const Duration(milliseconds: 700),
          transitionType: ContainerTransitionType.fade,
          openColor: Colors.transparent,
          closedColor: Colors.transparent,
          middleColor: Colors.transparent,
          closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          closedBuilder: (_, void Function() action) {
            return ShoppingCartItem(
              key: ValueKey(
                shoppingCart.shoppingCartItems[index].menuItem.id,
              ),
              shoppingCartItem: shoppingCart.shoppingCartItems[index],
              onTap: action,
            );
          },
          openBuilder: (_, __) {
            return MenuItemDetailsScreen(
              menuItem: shoppingCart.shoppingCartItems[index].menuItem,
            );
          },
        );
      },
    );
  }
}
