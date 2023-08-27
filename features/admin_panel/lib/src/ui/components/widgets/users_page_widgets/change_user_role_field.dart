import 'package:core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ChangeUserRoleField extends StatelessWidget {
  final String userRole;
  final Function(String?) onChanged;

  const ChangeUserRoleField({
    super.key,
    required this.userRole,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);

    return DropdownButton<String>(
      value: AppConstants.userRoles
          .firstWhere((element) => element == userRole),
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
      items: AppConstants.userRoles.map<DropdownMenuItem<String>>(
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
