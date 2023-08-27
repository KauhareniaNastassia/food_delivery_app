import 'package:admin_panel/admin_panel.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class UsersPageContent extends StatefulWidget {
  const UsersPageContent({Key? key}) : super(key: key);

  @override
  State<UsersPageContent> createState() => _UsersPageContentState();
}

class _UsersPageContentState extends State<UsersPageContent>
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

    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
      builder: (BuildContext context, AdminPanelState state) {
        if (state.usersList.isNotEmpty) {
          return PageRefresher(
            onRefresh: () async {
              context.read<AdminPanelBloc>().add(
                    InitUsersEvent(),
                  );
            },
            child: SafeArea(
              child: FadeTransition(
                opacity: _animation,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        CustomFilter(
                          filterItems: <String>[
                            AppConstants.allUsers,
                            ...AppConstants.userRoles,
                          ],
                          onTap: (String filterValue) {
                            context.read<AdminPanelBloc>().add(
                                  FilterUsersByRoleEvent(
                                    filterValue: filterValue,
                                  ),
                                );
                          },
                          selectedFilter: state.selectedFilter,
                        ),
                        SizedBox(height: mediaQueryData.size.height * 0.01),
                        AnimatedCrossFade(
                          firstCurve: Curves.easeOutBack,
                          secondCurve: Curves.easeInBack,
                          firstChild: UserItemsList(
                            userItemsList: state.filteredUserList.isEmpty
                                ? state.usersList
                                : state.filteredUserList,
                          ),
                          secondChild: NothingFindScreen(
                            riveAnimationPath:
                                AnimationPathConstants.nothingInUserFilterPath,
                            title: 'nothingInCategory'.tr(),
                          ),
                          crossFadeState:
                              (state.selectedFilter != AppConstants.allUsers) &
                                      state.filteredUserList.isEmpty
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return NothingFindScreen(
            riveAnimationPath: AnimationPathConstants.nothingInUserFilterPath,
            title: 'somethingWentWrongError'.tr(),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
