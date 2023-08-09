import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
import 'package:navigation/navigation.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:shopping_cart/shopping_cart.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(
            checkIsUserLoggedUseCase: instance.get<CheckIsUserLoggedUseCase>(),
            signInUseCase: instance.get<SignInUseCase>(),
            signUpUseCase: instance.get<SignUpUseCase>(),
            signOutUseCase: instance.get<SignOutUseCase>(),
            signInViaGoogleUseCase: instance.get<SignInViaGoogleUseCase>(),
          ),
        ),
        BlocProvider<SettingsBloc>(
          create: (_) => SettingsBloc(
            getThemeUseCase: instance.get<GetThemeUseCase>(),
            setThemeUseCase: instance.get<SetThemeUseCase>(),
            getColorSchemeUseCase: instance.get<GetColorSchemeUseCase>(),
            setColoSchemeUseCase: instance.get<SetColorSchemeUseCase>(),
            getFontSizeUseCase: instance.get<GetFontSizeUseCase>(),
            setFontSizeUseCase: instance.get<SetFontSizeUseCase>(),
          ),
        ),
        BlocProvider<NavigateToPageBloc>(
          create: (_) => NavigateToPageBloc(
            appRouter: instance.get<AppRouter>(),
          ),
        ),
        BlocProvider<MenuBloc>(
          create: (_) => MenuBloc(
            fetchMenuItemsUseCase: instance.get<FetchMenuItemsUseCase>(),
          ),
        ),
        BlocProvider<ShoppingCartBloc>(
          create: (_) => ShoppingCartBloc(
            getShoppingCartUseCase: instance.get<GetShoppingCartUseCase>(),
            addShoppingCartItemUseCase:
                instance.get<AddShoppingCartItemUseCase>(),
            removeShoppingCartItemUseCase:
                instance.get<RemoveShoppingCartItemUseCase>(),
            clearShoppingCartUseCase: instance.get<ClearShoppingCartUseCase>(),
            getUserIdUseCase: instance.get<GetUserIdUseCase>(),
          ),
        ),
        BlocProvider<OrderHistoryBloc>(
          create: (_) => OrderHistoryBloc(
            fetchOrderHistoryUseCase: instance.get<FetchOrderHistoryUseCase>(),
            getUserIdUseCase: instance.get<GetUserIdUseCase>(),
            createOrderUseCase: instance.get<CreateOrderUseCase>(),
          ),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) {
          return MaterialApp.router(
            theme: state.isLight
                ? AppTheme(
                    isStandardColorScheme: state.isStandardColorScheme,
                    fontSize: state.fontSize,
                  ).lightThemeData
                : AppTheme(
                    isStandardColorScheme: state.isStandardColorScheme,
                    fontSize: state.fontSize,
                  ).darkThemeData,
            routerDelegate: instance.get<AppRouter>().delegate(),
            routeInformationParser:
                instance.get<AppRouter>().defaultRouteParser(),
          );
        },
      ),
    );
  }
}
