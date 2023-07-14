import 'package:core_ui/core_ui.dart';
import 'package:domain/models/shopping_cart_model/shopping_cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/src/ui/widgets/item_amount.dart';

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
                    color: Theme.of(context).cardColor,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: size.width / 2,
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            shoppingCartItem.menuItem.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '\$${shoppingCartItem.menuItem.cost}',
                            style: AppTextStyles.size18WeightSemiBoldText(
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
                height: size.height / 8,
                width: size.width / 3.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [AppStyles.boxShadow],
                ),
                child: ClipOval(
                  child: shoppingCartItem.menuItem.image.isEmpty
                      ? const ImagePlaceholder(
                          iconData: Icons.fastfood_rounded,
                          iconSize: 50,
                        )
                      : Image.network(
                          shoppingCartItem.menuItem.image,
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
