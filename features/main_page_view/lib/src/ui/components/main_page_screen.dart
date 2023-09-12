import 'package:admin_panel/admin_panel.dart';
import 'package:auth/auth.dart';
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

class _MainPageScreenState extends State<MainPageScreen>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final AuthBloc authBloc = context.read<AuthBloc>();
    final AdminPanelBloc adminPanelBloc = context.read<AdminPanelBloc>();

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MenuBloc, MenuState>(
          listener: (BuildContext context, MenuState state) {
            if (!state.isInternetConnectionAvailable) {
              NotificationToast.showNotification(
                context,
                'internetConnectionIsNotAvailable'.tr(),
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
                child: FadeTransition(
                  opacity: _animation,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(height: mediaQueryData.size.height * 0.01),
                          authBloc.state.userRole == AppConstants.userRoles[0]
                              ? const BannerBlock()
                              : SizedBox(
                                  child: PrimaryButton(
                                    buttonTitle: 'addNewItem'.tr(),
                                    onPressed: () {
                                      adminPanelBloc.add(
                                        const NavigateToAddItemPageEvent(),
                                      );
                                    },
                                  ),
                                ),
                          SizedBox(height: mediaQueryData.size.height * 0.02),
                          CategoryFilter(
                            filterItems: <String>[
                              AppConstants.allFoods,
                              ...state.menuItemCategories
                            ],
                            selectedFilter: state.selectedCategory,
                            onTap: (String categoryValue) {
                              context.read<MenuBloc>().add(
                                    FilterMenuByCategoryEvent(
                                      category: categoryValue,
                                    ),
                                  );
                            },
                          ),
                          SizedBox(height: mediaQueryData.size.height * 0.02),
                          AnimatedCrossFade(
                            firstCurve: Curves.easeOutBack,
                            secondCurve: Curves.easeInBack,
                            firstChild: MenuListItems(
                              isCustomer: authBloc.state.userRole ==
                                  AppConstants.userRoles[0],
                              menu: state.filteredMenu.isEmpty
                                  ? state.menu
                                  : state.filteredMenu,
                            ),
                            secondChild: NothingFindScreen(
                              riveAnimationPath:
                                  AnimationPathConstants.nothingInCategoryPath,
                              title: 'nothingInCategory'.tr(),
                            ),
                            crossFadeState: (state.selectedCategory !=
                                        AppConstants.allFoods) &
                                    state.filteredMenu.isEmpty
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(
                  'errorLoadingDishes'.tr(),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
