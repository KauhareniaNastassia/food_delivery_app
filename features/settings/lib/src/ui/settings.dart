import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'contact_links/contact_links_view.dart';

class SettingsPageContent extends StatelessWidget {
  const SettingsPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            // const ContactLinksScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: const ContactLinksView(),
      ),
    );
  }
}
