import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ItemListButton extends StatefulWidget {
  final VoidCallback onTap;

  const ItemListButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  ItemListButtonState createState() => ItemListButtonState();
}

class ItemListButtonState extends State<ItemListButton> {
  bool _isPressed = false;

  void _toggleButton() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () {
          widget.onTap();
          _toggleButton();
        },
        child: CircleAvatar(
          minRadius: 13,
          backgroundColor: _isPressed
              ? Theme.of(context).canvasColor
              : Theme.of(context).primaryColor,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: _toggleButton,
              icon: Icon(
                _isPressed
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
