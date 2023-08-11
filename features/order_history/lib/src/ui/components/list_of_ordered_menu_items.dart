import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ListOfOrderedMenuItems extends StatelessWidget {
  final List<ShoppingCartItemModel> orderedItems;
  final bool addedCutlery;

  const ListOfOrderedMenuItems({
    super.key,
    required this.orderedItems,
    required this.addedCutlery,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: orderedItems.length,
          itemBuilder: (_, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${orderedItems[index].amount} x '
                      '${orderedItems[index].menuItem.title}',
                      style: theme.textTheme.bodySmall,
                    ),
                    Text(
                      '\$${(orderedItems[index].amount
                          * orderedItems[index].menuItem.cost)
                          .toStringAsFixed(2)}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                SizedBox(height: mediaQueryData.size.height * 0.007),
              ],
            );
          },
        ),
        Divider(
          color: theme.unselectedWidgetColor,
          thickness: 1,
        ),
        Text(
          addedCutlery
              ? appLocalization.translate('addedCutlery')
              : appLocalization.translate('notAddedCutlery'),
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}
