import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecases/fetch_menu_items_usecase.dart';
import 'package:domain/usecases/fetch_shopping_cart_items_use_case.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
import 'package:navigation/navigation.dart';
import 'package:shopping_cart/shopping_cart.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuBloc>(
          create: (_) => MenuBloc(
            fetchMenuItemsUseCase: instance.get<FetchMenuItemsUseCase>(),
          ),
        ),
        BlocProvider<ShoppingCartBloc>(
          create: (_) => ShoppingCartBloc(
            fetchShoppingCartItemsUseCase:
                instance.get<FetchShoppingCartItemsUseCase>(),
          ),
        )
      ],
      child: AutoTabsScaffold(
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
      ),
    );
  }
}
