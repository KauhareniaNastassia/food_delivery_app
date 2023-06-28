import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class ItemListButton extends StatelessWidget {
  final VoidCallback onTap;

  const ItemListButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          minRadius: 15,
          backgroundColor: AppColors.primaryColor,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: AppColors.primaryButtonTextColor,
              )),
        ),
      ),
    );
  }
}
