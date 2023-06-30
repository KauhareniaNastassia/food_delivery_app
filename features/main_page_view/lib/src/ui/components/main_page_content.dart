import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../bloc/bloc.dart';
import 'menu_list_items.dart';

class MainPageContent extends StatefulWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  State<MainPageContent> createState() => _MainPageContentState();
}

class _MainPageContentState extends State<MainPageContent> {
  final ScrollController _scrollController = ScrollController();
  bool _isPressed = false;

  void _toggleButton() {
    setState(() {
      _isPressed = !_isPressed;
    });
    context.read<SwitchBloc>().add(
          context.read<SwitchBloc>().state.switchValue
              ? SwitchOffEvents()
              : SwitchOnEvents(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Delivery App'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                _isPressed
                    ? Icons.brightness_2_outlined
                    : Icons.brightness_4_rounded,
              ),
              color: AppColors.backgroundColor,
              onPressed: () {
                _toggleButton();
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                  ],
                ),
                BlocBuilder<MenuBloc, MenuState>(
                  builder: (BuildContext context, MenuState state) {
                    if (state is MenuLoadingState) {
                      return const LoadingIndicator();
                    }
                    if (state is MenuLoadedState) {
                      return MenuListItems(menu: state.menu);
                    } else {
                      return const Text('Error loading dishes');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
