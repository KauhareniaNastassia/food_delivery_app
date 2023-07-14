import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecases/fetch_menu_items_usecase.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
import 'package:navigation/navigation.dart';
import 'package:shopping_cart/shopping_cart.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppThemeBloc>(
          create: (_) => AppThemeBloc(),
        ),
        BlocProvider<NavigateToPageBloc>(
          create: (_) => NavigateToPageBloc(),
        ),
        BlocProvider<MenuBloc>(
          create: (_) => MenuBloc(
            fetchMenuItemsUseCase: instance.get<FetchMenuItemsUseCase>(),
          ),
        ),
        BlocProvider<ShoppingCartBloc>(
          create: (_) => ShoppingCartBloc(),
        )
      ],
      child: BlocBuilder<AppThemeBloc, AppThemeState>(
        builder: (BuildContext context, AppThemeState state) {
          return MaterialApp.router(
            theme: state.isLight
                ? AppTheme().lightThemeData
                : AppTheme().darkThemeData,
            routerDelegate: instance.get<AppRouter>().delegate(),
            routeInformationParser:
                instance.get<AppRouter>().defaultRouteParser(),
          );
        },
      ),
    );
  }
}
