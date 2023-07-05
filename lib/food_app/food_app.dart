import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
import 'package:navigation/navigation.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppThemeBloc>(
      create: (context) => AppThemeBloc(),
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
