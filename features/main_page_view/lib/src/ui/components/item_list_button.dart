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
              ? AppColors.backgroundItemColor
              : AppColors.primaryColor,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryColor,
                width: 2.0,
              ),
            ),
            child: IconButton(
              onPressed: _toggleButton,
              icon: Icon(
                _isPressed
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined,
                color: _isPressed
                    ? AppColors.primaryColor
                    : AppColors.primaryButtonTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
