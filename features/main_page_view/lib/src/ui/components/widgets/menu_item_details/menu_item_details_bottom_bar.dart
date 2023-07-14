import 'package:flutter/material.dart';

import 'add_to_cart_button.dart';

class MenuItemDetailsBottomBar extends StatelessWidget {
  final VoidCallback onPressed;
  final int? amount;

  const MenuItemDetailsBottomBar({
    super.key,
    required this.onPressed,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      child: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
        child: AddToCartButton(
          amount: amount,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
