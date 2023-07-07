import 'package:core/core.dart';
import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:domain/models/shopping_cart_model/shopping_cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
import 'package:navigation/navigation.dart';
import 'package:shopping_cart/src/ui/shopping_cart_item.dart';

class ShoppingCartListItems extends StatelessWidget {
  final List<MenuItemModel> shoppingCartItems;

  const ShoppingCartListItems({
    Key? key,
    required this.shoppingCartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: shoppingCartItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ShoppingCartItem(
            key: ValueKey(shoppingCartItems[index].id),
            shoppingCartItemModel: shoppingCartItems[index],
            onTap: () {
              context.navigateTo(
                MenuItemDetailsScreenRoute(
                  menuItem: shoppingCartItems[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
