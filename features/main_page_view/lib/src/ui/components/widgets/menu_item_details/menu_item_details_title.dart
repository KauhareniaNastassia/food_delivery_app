import 'package:flutter/material.dart';

class MenuItemDetailsTitle extends StatelessWidget {
  final String title;
  final double cost;

  const MenuItemDetailsTitle({
    super.key,
    required this.title,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Text(
          '\$$cost',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
