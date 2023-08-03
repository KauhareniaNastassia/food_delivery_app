import 'package:flutter/material.dart';

import 'package:core_ui/core_ui.dart';

class ItemImage extends StatelessWidget {
  final String image;

  const ItemImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: image,
      placeholder: (_, __) => const SizedBox(
        child: LoadingIndicator(),
      ),
      errorWidget: (_, __, ___) => const ImagePlaceholder(
        iconData: Icons.fastfood,
        iconSize: 50,
      ),
    );
  }
}
