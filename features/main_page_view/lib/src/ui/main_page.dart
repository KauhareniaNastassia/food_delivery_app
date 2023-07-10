import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        MainPageScreenRoute(),
        ShoppingCartPageScreenRoute(),
        OrderHistoryPageContentRoute(),
        SettingsPageContentRoute(),
      ],
      appBarBuilder: (_, tabsRouter) {
        return const CustomAppBar();
      },
      bottomNavigationBuilder: (_, tabsRouter) {
        return CustomBottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}
