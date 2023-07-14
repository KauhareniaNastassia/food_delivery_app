import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MenuItemDetailsImage extends StatelessWidget {
  final String image;

  const MenuItemDetailsImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return FlexibleSpaceBar(
      background: image.isNotEmpty
          ? Image.network(
              image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => ImagePlaceholder(
                iconData: Icons.fastfood,
                iconSize: size.width * 0.3,
              ),
            )
          : ImagePlaceholder(
              iconData: Icons.fastfood,
              iconSize: size.width * 0.3,
            ),
    );
  }
}
