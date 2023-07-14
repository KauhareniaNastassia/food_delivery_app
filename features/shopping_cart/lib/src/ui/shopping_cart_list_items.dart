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
    final NavigateToPageBloc navigateToPageBloc =
        context.read<NavigateToPageBloc>();

    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: shoppingCart.shoppingCartItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ShoppingCartItem(
            key: ValueKey(shoppingCart.shoppingCartItems[index].menuItem.id),
            shoppingCartItem: shoppingCart.shoppingCartItems[index],
            onTap: () {
              navigateToPageBloc.add(
                NavigateToMenuItemEvent(
                  context: context,
                  menuItem: shoppingCart.shoppingCartItems[index].menuItem,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
