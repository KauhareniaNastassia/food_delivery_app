import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MenuItemImage extends StatelessWidget {
  final String image;

  const MenuItemImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Container(
      height: size.height / 6,
      width: size.width / 2.85,
      decoration: BoxDecoration(
        color: AppColors.backgroundItemColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [AppStyles.boxShadow],
      ),
      child: ClipOval(
        child: ItemImage(
          image: image,
        ),
      ),
    );
  }
}
