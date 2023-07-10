import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/shopping_cart.dart';

import 'widgets/item_list_button.dart';

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
  late bool isItemInCart;

  _isItemInShoppingCart() {
    if (context
        .read<ShoppingCartBloc>()
        .state
        .shoppingCart
        .shoppingCartItems
        .any((item) => item.menuItem.id == widget.menuItem.id)) {
      isItemInCart = true;
    } else {
      isItemInCart = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _isItemInShoppingCart();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return BlocConsumer<ShoppingCartBloc, ShoppingCartState>(
      listener: (context, state) {
        _isItemInShoppingCart();
      },
      builder: (context, state) {
        return Ink(
          child: InkWell(
            borderRadius: AppStyles.largeBorderRadius,
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: size.height / 6,
                      width: size.width / 1.2,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: AppStyles.largeBorderRadius,
                        color: Theme.of(context).cardColor,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: size.width / 2,
                          padding: const EdgeInsets.only(left: 40),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.menuItem.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 40),
                              Text(
                                '\$${widget.menuItem.cost}',
                                style: AppTextStyles.size22WeightSemiBoldText(
                                  Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height / 6,
                    width: size.width / 2.8,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundItemColor,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [AppStyles.boxShadow],
                    ),
                    child: ClipOval(
                      child: widget.menuItem.image.isEmpty
                          ? const ImagePlaceholder(
                              iconData: Icons.fastfood_rounded,
                              iconSize: 50,
                            )
                          : Image.network(
                              widget.menuItem.image,
                            ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 0,
                    child: ItemListButton(
                      isItemInCart: isItemInCart,
                      onPressed: () {
                        context.read<ShoppingCartBloc>().add(
                              (AddShoppingCartItemEvent(
                                  menuItem: widget.menuItem)),
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
