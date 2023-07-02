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
    MainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    MainRouteScreen.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MainPageScreen(),
      );
    },
    OrderHistoryRouteContent.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OrderHistoryPageContent(),
      );
    },
    ShoppingCartRouteContent.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ShoppingCartPageContent(),
      );
    },
    SettingsRouteContent.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsPageContent(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MainRoute.name,
          path: '/',
          children: [
            RouteConfig(
              MainRouteScreen.name,
              path: '',
              parent: MainRoute.name,
            ),
            RouteConfig(
              OrderHistoryRouteContent.name,
              path: 'order-history-page-content',
              parent: MainRoute.name,
            ),
            RouteConfig(
              ShoppingCartRouteContent.name,
              path: 'shopping-cart-page-content',
              parent: MainRoute.name,
            ),
            RouteConfig(
              SettingsRouteContent.name,
              path: 'settings-page-content',
              parent: MainRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [MainPageScreen]
class MainRouteScreen extends PageRouteInfo<void> {
  const MainRouteScreen()
      : super(
          MainRouteScreen.name,
          path: '',
        );

  static const String name = 'MainRouteScreen';
}

/// generated route for
/// [OrderHistoryPageContent]
class OrderHistoryRouteContent extends PageRouteInfo<void> {
  const OrderHistoryRouteContent()
      : super(
          OrderHistoryRouteContent.name,
          path: 'order-history-page-content',
        );

  static const String name = 'OrderHistoryRouteContent';
}

/// generated route for
/// [ShoppingCartPageContent]
class ShoppingCartRouteContent extends PageRouteInfo<void> {
  const ShoppingCartRouteContent()
      : super(
          ShoppingCartRouteContent.name,
          path: 'shopping-cart-page-content',
        );

  static const String name = 'ShoppingCartRouteContent';
}

/// generated route for
/// [SettingsPageContent]
class SettingsRouteContent extends PageRouteInfo<void> {
  const SettingsRouteContent()
      : super(
          SettingsRouteContent.name,
          path: 'settings-page-content',
        );

  static const String name = 'SettingsRouteContent';
}
