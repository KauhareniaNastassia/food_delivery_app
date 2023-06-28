import 'package:core/config/di/app_di.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecases/fetch_menu_items_usecase.dart';
import 'package:flutter/material.dart';

import '../bloc/bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuBloc>(
        create: (BuildContext context) => MenuBloc(
            fetchMenuItemsUseCase: instance.get<FetchMenuItemsUseCase>())
          ..add(InitEvent()),
        child: Scaffold(
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                      ],
                    ),
                    BlocBuilder<MenuBloc, MenuState>(
                      builder: (BuildContext contextWidget, MenuState state) {
                        if (state is MenuLoadingState) {
                          return const LoadingIndicator();
                        }
                        if (state is MenuLoadedState) {
                          return ListMenuItems(menu: state.menu);
                        } else {
                          return const Text('Error loading dishes');
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
