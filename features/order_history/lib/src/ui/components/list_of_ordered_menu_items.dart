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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: orderedItems.length,
          itemBuilder: (_, index) {
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
                      '${orderedItems[index].amount * orderedItems[index].menuItem.cost}',
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
        // const SizedBox(height: 5),
        Text(
          addedCutlery
              ? AppConstants.addedCutlery
              : AppConstants.notAddedCutlery,
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}
