import 'package:core/core.dart';
import 'package:domain/models/shopping_cart_model/shopping_cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/src/ui/widgets/update_count_button.dart';

import '../../../shopping_cart.dart';

class ItemAmount extends StatelessWidget {
  final ShoppingCartItemModel shoppingCartItem;
  final int amount;

  const ItemAmount({
    super.key,
    required this.shoppingCartItem,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ShoppingCartBloc shoppingCartBloc = context.read<ShoppingCartBloc>();

    return Row(
      children: <Widget>[
        UpdateCountButton(
          icon: Icons.remove,
          onPressed: () {
            shoppingCartBloc.add(
              (RemoveShoppingCartItemEvent(
                shoppingCartItem: shoppingCartItem,
              )),
            );
          },
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: size.width / 16,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '$amount',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        const SizedBox(width: 15),
        UpdateCountButton(
          icon: Icons.add,
          onPressed: () {
            shoppingCartBloc.add(
              (AddShoppingCartItemEvent(
                menuItem: shoppingCartItem.menuItem,
              )),
            );
          },
        ),
      ],
    );
  }
}
