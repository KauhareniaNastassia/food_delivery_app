import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ItemListButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isItemInCart;

  const ItemListButton({
    Key? key,
    required this.onPressed,
    required this.isItemInCart,
  }) : super(key: key);

  @override
  ItemListButtonState createState() => ItemListButtonState();
}

class ItemListButtonState extends State<ItemListButton> {

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () {},
        child: CircleAvatar(
          minRadius: 13,
          backgroundColor: widget.isItemInCart
              ? Theme.of(context).canvasColor
              : Theme.of(context).primaryColor,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: widget.onPressed,
              icon: Icon(
                widget.isItemInCart
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined,
                color: AppColors.primaryButtonTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
