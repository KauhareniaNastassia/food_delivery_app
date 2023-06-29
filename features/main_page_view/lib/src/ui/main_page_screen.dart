import 'package:core/config/di/app_di.dart';
import 'package:core/core.dart';
import 'package:domain/usecases/fetch_menu_items_usecase.dart';
import 'package:flutter/material.dart';

import '../bloc/bloc.dart';
import 'components/main_page_content.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuBloc>(
      create: (BuildContext context) => MenuBloc(
        fetchMenuItemsUseCase: instance.get<FetchMenuItemsUseCase>(),
      )..add(InitEvent()),
      child: const MainPageContent(),
    );
  }
}
