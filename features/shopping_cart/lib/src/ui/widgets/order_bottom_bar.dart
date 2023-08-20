import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class OrderBottomBar extends StatelessWidget {
  final double totalPrice;
  final VoidCallback onPressed;

  const OrderBottomBar({
    super.key,
    required this.totalPrice,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    //final AppLocalizations appLocalization = AppLocalizations.of(context)!;

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'totalPrice'.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: PrimaryButton(
                        buttonTitle: 'makeAnOrder'.tr(),
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
