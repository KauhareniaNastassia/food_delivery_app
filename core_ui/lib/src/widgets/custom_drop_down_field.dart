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

    final List<DropdownMenuItem<String>> dropDownListOfItems =
        listOfItems.map<DropdownMenuItem<String>>(
      (String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      },
    ).toList();

    return DropdownButton<String>(
      value: listOfItems.firstWhere((String element) => element == value),
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        size: mediaQueryData.size.height * 0.05,
      ),
      style: theme.textTheme.displayMedium,
      underline: Container(
        height: mediaQueryData.size.height * 0.002,
        color: theme.primaryColor,
      ),
      onChanged: (String? value) => onChanged(value ?? ''),
      items: dropDownListOfItems,
    );
  }
}
