// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    SignInPageScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignInPageScreen(),
      );
    },
    MainPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    MenuItemDetailsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MenuItemDetailsScreenRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MenuItemDetailsScreen(
          key: args.key,
          menuItem: args.menuItem,
        ),
      );
    },
    AdminPanelPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AdminPanelPage(),
      );
    },
    MenuItemDetailsScreenForAdminRoute.name: (routeData) {
      final args = routeData.argsAs<MenuItemDetailsScreenForAdminRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MenuItemDetailsScreenForAdmin(
          key: args.key,
          menuItem: args.menuItem,
        ),
      );
    },
    MainPageScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MainPageScreen(),
      );
    },
    ShoppingCartPageScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ShoppingCartPageScreen(),
      );
    },
    OrderHistoryPageContentRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OrderHistoryPageContent(),
      );
    },
    SettingsPageContentRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsPageContent(),
      );
    },
    OrdersPageContentRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OrdersPageContent(),
      );
    },
    UsersPageContentRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UsersPageContent(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        RouteConfig(
          SignInPageScreenRoute.name,
          path: '/sign-in-page-screen',
        ),
        RouteConfig(
          MainPageRoute.name,
          path: '/main-page',
          children: [
            RouteConfig(
              MainPageScreenRoute.name,
              path: 'main-page-screen',
              parent: MainPageRoute.name,
            ),
            RouteConfig(
              ShoppingCartPageScreenRoute.name,
              path: 'shopping-cart-page-screen',
              parent: MainPageRoute.name,
            ),
            RouteConfig(
              OrderHistoryPageContentRoute.name,
              path: 'order-history-page-content',
              parent: MainPageRoute.name,
            ),
            RouteConfig(
              SettingsPageContentRoute.name,
              path: 'settings-page-content',
              parent: MainPageRoute.name,
            ),
          ],
        ),
        RouteConfig(
          MenuItemDetailsScreenRoute.name,
          path: '/menu-item-details-screen',
        ),
        RouteConfig(
          AdminPanelPageRoute.name,
          path: '/admin-panel-page',
          children: [
            RouteConfig(
              MainPageScreenRoute.name,
              path: 'main-page-screen',
              parent: AdminPanelPageRoute.name,
            ),
            RouteConfig(
              OrdersPageContentRoute.name,
              path: 'orders-page-content',
              parent: AdminPanelPageRoute.name,
            ),
            RouteConfig(
              UsersPageContentRoute.name,
              path: 'users-page-content',
              parent: AdminPanelPageRoute.name,
            ),
            RouteConfig(
              SettingsPageContentRoute.name,
              path: 'settings-page-content',
              parent: AdminPanelPageRoute.name,
            ),
          ],
        ),
        RouteConfig(
          MenuItemDetailsScreenForAdminRoute.name,
          path: '/menu-item-details-screen-for-admin',
        ),
      ];
}

/// generated route for
/// [SplashScreen]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [SignInPageScreen]
class SignInPageScreenRoute extends PageRouteInfo<void> {
  const SignInPageScreenRoute()
      : super(
          SignInPageScreenRoute.name,
          path: '/sign-in-page-screen',
        );

  static const String name = 'SignInPageScreenRoute';
}

/// generated route for
/// [MainPage]
class MainPageRoute extends PageRouteInfo<void> {
  const MainPageRoute({List<PageRouteInfo>? children})
      : super(
          MainPageRoute.name,
          path: '/main-page',
          initialChildren: children,
        );

  static const String name = 'MainPageRoute';
}

/// generated route for
/// [MenuItemDetailsScreen]
class MenuItemDetailsScreenRoute
    extends PageRouteInfo<MenuItemDetailsScreenRouteArgs> {
  MenuItemDetailsScreenRoute({
    Key? key,
    required MenuItemModel menuItem,
  }) : super(
          MenuItemDetailsScreenRoute.name,
          path: '/menu-item-details-screen',
          args: MenuItemDetailsScreenRouteArgs(
            key: key,
            menuItem: menuItem,
          ),
        );

  static const String name = 'MenuItemDetailsScreenRoute';
}

class MenuItemDetailsScreenRouteArgs {
  const MenuItemDetailsScreenRouteArgs({
    this.key,
    required this.menuItem,
  });

  final Key? key;

  final MenuItemModel menuItem;

  @override
  String toString() {
    return 'MenuItemDetailsScreenRouteArgs{key: $key, menuItem: $menuItem}';
  }
}

/// generated route for
/// [AdminPanelPage]
class AdminPanelPageRoute extends PageRouteInfo<void> {
  const AdminPanelPageRoute({List<PageRouteInfo>? children})
      : super(
          AdminPanelPageRoute.name,
          path: '/admin-panel-page',
          initialChildren: children,
        );

  static const String name = 'AdminPanelPageRoute';
}

/// generated route for
/// [MenuItemDetailsScreenForAdmin]
class MenuItemDetailsScreenForAdminRoute
    extends PageRouteInfo<MenuItemDetailsScreenForAdminRouteArgs> {
  MenuItemDetailsScreenForAdminRoute({
    Key? key,
    required MenuItemModel menuItem,
  }) : super(
          MenuItemDetailsScreenForAdminRoute.name,
          path: '/menu-item-details-screen-for-admin',
          args: MenuItemDetailsScreenForAdminRouteArgs(
            key: key,
            menuItem: menuItem,
          ),
        );

  static const String name = 'MenuItemDetailsScreenForAdminRoute';
}

class MenuItemDetailsScreenForAdminRouteArgs {
  const MenuItemDetailsScreenForAdminRouteArgs({
    this.key,
    required this.menuItem,
  });

  final Key? key;

  final MenuItemModel menuItem;

  @override
  String toString() {
    return 'MenuItemDetailsScreenForAdminRouteArgs{key: $key, menuItem: $menuItem}';
  }
}

/// generated route for
/// [MainPageScreen]
class MainPageScreenRoute extends PageRouteInfo<void> {
  const MainPageScreenRoute()
      : super(
          MainPageScreenRoute.name,
          path: 'main-page-screen',
        );

  static const String name = 'MainPageScreenRoute';
}

/// generated route for
/// [ShoppingCartPageScreen]
class ShoppingCartPageScreenRoute extends PageRouteInfo<void> {
  const ShoppingCartPageScreenRoute()
      : super(
          ShoppingCartPageScreenRoute.name,
          path: 'shopping-cart-page-screen',
        );

  static const String name = 'ShoppingCartPageScreenRoute';
}

/// generated route for
/// [OrderHistoryPageContent]
class OrderHistoryPageContentRoute extends PageRouteInfo<void> {
  const OrderHistoryPageContentRoute()
      : super(
          OrderHistoryPageContentRoute.name,
          path: 'order-history-page-content',
        );

  static const String name = 'OrderHistoryPageContentRoute';
}

/// generated route for
/// [SettingsPageContent]
class SettingsPageContentRoute extends PageRouteInfo<void> {
  const SettingsPageContentRoute()
      : super(
          SettingsPageContentRoute.name,
          path: 'settings-page-content',
        );

  static const String name = 'SettingsPageContentRoute';
}

/// generated route for
/// [OrdersPageContent]
class OrdersPageContentRoute extends PageRouteInfo<void> {
  const OrdersPageContentRoute()
      : super(
          OrdersPageContentRoute.name,
          path: 'orders-page-content',
        );

  static const String name = 'OrdersPageContentRoute';
}

/// generated route for
/// [UsersPageContent]
class UsersPageContentRoute extends PageRouteInfo<void> {
  const UsersPageContentRoute()
      : super(
          UsersPageContentRoute.name,
          path: 'users-page-content',
        );

  static const String name = 'UsersPageContentRoute';
}
