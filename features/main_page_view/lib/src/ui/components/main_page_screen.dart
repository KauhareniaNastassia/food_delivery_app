import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
import 'package:settings/settings.dart';

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
    final AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MenuBloc, MenuState>(
          listener: (BuildContext context, MenuState state) {
            if (!state.isInternetConnectionAvailable) {
              NotificationToast.showNotification(
                context,
                appLocalization.translate('internetConnectionIsNotAvailable'),
                mediaQueryData,
                settingsBloc,
                Icons.error_outline_rounded,
                AppColors.errorBackgroundColor,
              );
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
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: mediaQueryData.size.height * 0.02),
                        const CategoryFilter(),
                        SizedBox(height: mediaQueryData.size.height * 0.02),
                        (state.selectedCategory !=
                                    AppConstants.menuItemCategory[0]) &
                                state.filteredMenu.isEmpty
                            ? const NothingFindInCategory()
                            : MenuListItems(
                                menu: state.filteredMenu.isEmpty
                                    ? state.menu
                                    : state.filteredMenu,
                              ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(
                  appLocalization.translate('errorLoadingDishes'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
