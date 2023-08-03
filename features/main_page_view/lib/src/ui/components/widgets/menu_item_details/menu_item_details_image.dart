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
    return FlexibleSpaceBar(
      background: ItemImage(
        image: image,
      ),
    );
  }
}
