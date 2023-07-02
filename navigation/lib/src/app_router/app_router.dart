import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:main_page_view/main_page.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:shopping_cart/shopping_cart.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: "/",
      page: MainPage,
      children: [
        AutoRoute(
          page: MainPageScreen,
          initial: true,
        ),
        AutoRoute(
          page:ShoppingCartPageContent,
        ),
        AutoRoute(
          page: OrderHistoryPageContent,
        ),
        AutoRoute(
          page: SettingsPageContent,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
