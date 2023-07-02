import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isPressed = false;

  void _toggleButton() {
    setState(() {
      _isPressed = !_isPressed;
    });
    context.read<AppThemeBloc>().add(
          context.read<AppThemeBloc>().state.appThemeIsChanged
              ? DarkAppThemeEvent()
              : LightAppThemeEvent(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        MainRouteScreen(),
        ShoppingCartRouteContent(),
        OrderHistoryRouteContent(),
        SettingsRouteContent(),
      ],
      appBarBuilder: (_, tabsRouter) {
        return CustomAppBar(
          isPressed: _isPressed,
          toggleButton: _toggleButton,
        );
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
