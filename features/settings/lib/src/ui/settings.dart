import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SettingsPageContent extends StatelessWidget {
  const SettingsPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.settings,
            size: size.width * 0.15,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            'Settings coming soon',
            style: AppTextStyles.size18WeightSemiBoldText(
              Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
