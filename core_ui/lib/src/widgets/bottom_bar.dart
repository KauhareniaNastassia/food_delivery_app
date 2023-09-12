import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final double? totalPrice;
  final String? title;
  final String buttonTitle;
  final VoidCallback onPressed;

  const BottomBar({
    super.key,
    this.totalPrice,
    this.title,
    required this.buttonTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 5, 20, 15),
        decoration: BoxDecoration(
          borderRadius: AppStyles.largeBorderRadius,
        ),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: totalPrice == null
                      ? const SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              title ?? '',
                              style: theme.textTheme.titleMedium,
                            ),
                            Text(
                              '\$${totalPrice?.toStringAsFixed(2)}',
                              style: theme.textTheme.titleLarge,
                            ),
                          ],
                        ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: PrimaryButton(
                        buttonTitle: buttonTitle,
                        onPressed: onPressed,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
