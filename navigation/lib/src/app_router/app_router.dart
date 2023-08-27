import 'package:flutter/cupertino.dart';
import 'package:main_page_view/main_page.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:shopping_cart/shopping_cart.dart';
import 'package:admin_panel/admin_panel.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page, Screen, Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      initial: true,
    ),
    AutoRoute(
      page: SignInPageScreen,
    ),
    AutoRoute(
      page: MainPage,
      children: <AutoRoute>[
        AutoRoute(
          page: MainPageScreen,
        ),
        AutoRoute(
          page: ShoppingCartPageScreen,
        ),
        AutoRoute(
          page: OrderHistoryPageContent,
        ),
        AutoRoute(
          page: SettingsPageContent,
        ),
      ],
    ),
    AutoRoute(
      page: MenuItemDetailsScreen,
    ),
    AutoRoute(
      page: AdminPanelPage,
      children: <AutoRoute>[
        AutoRoute(
          page: MainPageScreen,
        ),
        AutoRoute(
          page: OrdersPageContent,
        ),
        AutoRoute(
          page: UsersPageContent,
        ),
        AutoRoute(
          page: SettingsPageContent,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
