import 'package:flutter/material.dart';

class OrdersPageContent extends StatelessWidget {
  const OrdersPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.history_outlined,
            size: size.width * 0.15,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            'Orders list coming soon',
            style: theme.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}