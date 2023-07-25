import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

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
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MenuBloc, MenuState>(
          listener: (BuildContext context, MenuState state) {
            if (!state.isInternetConnectionAvailable) {
              MotionToast.error(
                description: Text(
                  'Internet connection lost. Cached data is using.',
                  style: AppTextStyles.size18WeightSemiBoldText(
                    fontSize: settingsBloc.state.fontSize,
                    color: AppColors.primaryColor,
                  ),
                ),
                toastDuration: const Duration(seconds: 3),
                width: mediaQueryData.size.width * 0.9,
                height: mediaQueryData.size.height * 0.09,
                displayBorder: true,
                displaySideBar: false,
                iconSize: mediaQueryData.size.width * 0.12,
              ).show(context);
            }
          },
          builder: (BuildContext context, MenuState state) {
            if (state.isLoading) {
              return const LoadingIndicator();
            }
            if (state.menu.isNotEmpty) {
              return PageRefresher(
                onRefresh: () async {
                  context.read<MenuBloc>().add(
                        InitEvent(),
                      );
                },
                child: Container(
                  height: mediaQueryData.size.height,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Center(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 20),
                            ],
                          ),
                          MenuListItems(menu: state.menu),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text('Error loading dishes'),
              );
            }
          },
        ),
      ),
    );
  }
}
