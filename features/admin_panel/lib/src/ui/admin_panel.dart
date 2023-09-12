import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class AdminPanelPage extends StatefulWidget {
  const AdminPanelPage({Key? key}) : super(key: key);

  @override
  State<AdminPanelPage> createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends State<AdminPanelPage> {
  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.read<AuthBloc>();

    return AutoTabsScaffold(
      animationDuration: const Duration(milliseconds: 700),
      routes: const <PageRouteInfo<dynamic>>[
        MainPageScreenRoute(),
        OrdersPageContentRoute(),
        UsersPageContentRoute(),
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
          isCustomer: authBloc.state.userRole == AppConstants.userRoles[0],
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}
