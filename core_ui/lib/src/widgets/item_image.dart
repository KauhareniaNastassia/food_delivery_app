import 'package:flutter/material.dart';

import '../../core_ui.dart';

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
      placeholder: (context, url) => const SizedBox(
        child: LoadingIndicator(),
      ),
      errorWidget: (context, url, error) => const ImagePlaceholder(
        iconData: Icons.error_outline,
        iconSize: 50,
      ),
    );
  }
}
