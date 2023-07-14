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
          menuItem: args.menuItem,
          key: args.key,
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
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MainPageRoute.name,
          path: '/',
          children: [
            RouteConfig(
              MainPageScreenRoute.name,
              path: '',
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
      ];
}

/// generated route for
/// [MainPage]
class MainPageRoute extends PageRouteInfo<void> {
  const MainPageRoute({List<PageRouteInfo>? children})
      : super(
          MainPageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainPageRoute';
}

/// generated route for
/// [MenuItemDetailsScreen]
class MenuItemDetailsScreenRoute
    extends PageRouteInfo<MenuItemDetailsScreenRouteArgs> {
  MenuItemDetailsScreenRoute({
    required MenuItemModel menuItem,
    Key? key,
  }) : super(
          MenuItemDetailsScreenRoute.name,
          path: '/menu-item-details-screen',
          args: MenuItemDetailsScreenRouteArgs(
            menuItem: menuItem,
            key: key,
          ),
        );

  static const String name = 'MenuItemDetailsScreenRoute';
}

class MenuItemDetailsScreenRouteArgs {
  const MenuItemDetailsScreenRouteArgs({
    required this.menuItem,
    this.key,
  });

  final MenuItemModel menuItem;

  final Key? key;

  @override
  String toString() {
    return 'MenuItemDetailsScreenRouteArgs{menuItem: $menuItem, key: $key}';
  }
}

/// generated route for
/// [MainPageScreen]
class MainPageScreenRoute extends PageRouteInfo<void> {
  const MainPageScreenRoute()
      : super(
          MainPageScreenRoute.name,
          path: '',
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
