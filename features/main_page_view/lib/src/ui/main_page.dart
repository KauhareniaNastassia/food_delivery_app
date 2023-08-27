import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:auth/auth.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.read<AuthBloc>();

    return AutoTabsScaffold(
      animationDuration: const Duration(milliseconds: 700),
      routes: const <PageRouteInfo<dynamic>>[
        MainPageScreenRoute(),
        ShoppingCartPageScreenRoute(),
        OrderHistoryPageContentRoute(),
        SettingsPageContentRoute(),
      ],
      appBarBuilder: (_, TabsRouter tabsRouter) {
        return const CustomAppBar();
      },
      builder: (
        _,
        Widget? child,
        Animation<double> animation,
      ) {
        return FadeTransition(
          opacity: animation.drive(
            Tween<double>(
              begin: 0,
              end: 1,
            ).curved(Curves.easeIn),
          ),
          child: child,
        );
      },
      bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
        return CustomBottomNavigationBar(
          isAdmin: authBloc.state.userRole == 'customer',
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}
