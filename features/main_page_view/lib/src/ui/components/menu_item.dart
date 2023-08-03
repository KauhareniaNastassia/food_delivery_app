import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
import 'package:shopping_cart/shopping_cart.dart';

class MenuItem extends StatefulWidget {
  final MenuItemModel menuItem;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.menuItem,
    required this.onTap,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    final ShoppingCartBloc shoppingCartBloc = context.read<ShoppingCartBloc>();

    ShoppingCartItemModel? findItemInShoppingCart(MenuItemModel menuItem) {
      for (final item
          in shoppingCartBloc.state.shoppingCart.shoppingCartItems) {
        if (item.menuItem == widget.menuItem) {
          return item;
        }
      }
      return null;
    }

    return BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
      builder: (context, state) {
        return Ink(
          child: InkWell(
            borderRadius: AppStyles.largeBorderRadius,
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: <Widget>[
                  MenuItemTitle(
                    title: widget.menuItem.title,
                    cost: widget.menuItem.cost,
                  ),
                  MenuItemImage(
                    image: widget.menuItem.image,
                  ),
                  Positioned(
                    right: 5,
                    bottom: 0,
                    child: ItemListButton(
                      amount: findItemInShoppingCart(widget.menuItem)?.amount,
                      onPressed: () {
                        shoppingCartBloc.add(
                          AddShoppingCartItemEvent(
                            menuItem: widget.menuItem,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
