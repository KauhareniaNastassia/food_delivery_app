import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MenuItemDetailsIngredients extends StatelessWidget {
  final List<String> ingredients;

  const MenuItemDetailsIngredients({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Ingredients:',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 10),
        ingredients.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ingredients.length,
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return Row(
                    children: <Widget>[
                      const SizedBox(width: 15),
                      const CustomDotPoint(),
                      const SizedBox(width: 10),
                      Text(
                        ingredients[index],
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  );
                },
              )
            : Center(
                child: Text(
                  'No ingredients available',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
      ],
    );
  }
}
