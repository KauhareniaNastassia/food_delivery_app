import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SwitchBloc>(
      create: (context) => SwitchBloc(),
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (BuildContext context, SwitchState state) {
          return MaterialApp(
            theme: state.switchValue
                ? AppTheme().darkThemeData
                : AppTheme().lightThemeData,
            home: Builder(
              builder: (context) => const MainPageScreen(),
            ),
          );
        },
      ),
    );
  }
}
