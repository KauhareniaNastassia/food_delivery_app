import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/src/ui/widgets/widgets.dart';

class ShoppingCartItem extends StatelessWidget {
  final ShoppingCartItemModel shoppingCartItem;
  final VoidCallback onTap;

  const ShoppingCartItem({
    Key? key,
    required this.shoppingCartItem,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);

    return Ink(
      child: InkWell(
        borderRadius: AppStyles.largeBorderRadius,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: size.height / 8,
                  width: size.width / 1.2,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: AppStyles.largeBorderRadius,
                    color: theme.cardColor,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: size.width / 1.7,
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: ShoppingCartItemInfo(
                        //title: shoppingCartItem.menuItem.title,
                        title: shoppingCartItem.menuItem.titles[0].title,
                        cost: shoppingCartItem.menuItem.cost,
                        amount: shoppingCartItem.amount,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height / 8,
                width: size.width / 3.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [AppStyles.boxShadow],
                ),
                child: ClipOval(
                  child: ItemImage(
                    image: shoppingCartItem.menuItem.image,
                  ),
                ),
              ),
              Positioned(
                right: 25,
                bottom: 15,
                child: ItemAmount(
                  shoppingCartItem: shoppingCartItem,
                  amount: shoppingCartItem.amount,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
