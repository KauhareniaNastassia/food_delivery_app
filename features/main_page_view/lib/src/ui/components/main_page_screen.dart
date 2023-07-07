import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../bloc/bloc.dart';
import 'menu_list_items.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20),
                    ],
                  ),
                  BlocBuilder<MenuBloc, MenuState>(
                    builder: (BuildContext context, MenuState state) {
                      if (state is MenuLoadingState) {
                        return const Center(child: LoadingIndicator());
                      }
                      if (state is MenuLoadedState) {
                        return MenuListItems(menu: state.menu);
                      } else {
                        return const Center(
                          child: Text('Error loading dishes'),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
