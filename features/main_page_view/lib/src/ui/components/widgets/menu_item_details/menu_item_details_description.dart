import 'package:flutter/material.dart';

class MenuItemDetailsDescription extends StatelessWidget {
  final String description;

  const MenuItemDetailsDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        description.isNotEmpty
            ? Text(
                description,
                style: Theme.of(context).textTheme.titleSmall,
              )
            : Center(
                child: Text(
                  'No description available',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
      ],
    );
  }
}
