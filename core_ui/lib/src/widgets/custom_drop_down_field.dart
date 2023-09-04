import 'package:flutter/material.dart';

class CustomDropDownField extends StatelessWidget {
  final String value;
  final List<String> listOfItems;
  final Function(String?) onChanged;

  const CustomDropDownField({
    super.key,
    required this.value,
    required this.listOfItems,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);

    return DropdownButton<String>(
      value: listOfItems.firstWhere((element) => element == value),
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        size: mediaQueryData.size.height * 0.05,
      ),
      style: theme.textTheme.displayMedium,
      underline: Container(
        height: 2,
        color: theme.primaryColor,
      ),
      onChanged: (String? value) => onChanged(value!),
      items: listOfItems.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }
}
