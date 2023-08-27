import 'package:admin_panel/admin_panel.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:order_history/order_history.dart';

class UserItemsList extends StatefulWidget {
  final List<UserInfoModel> userItemsList;

  const UserItemsList({
    Key? key,
    required this.userItemsList,
  }) : super(key: key);

  @override
  State<UserItemsList> createState() => _UserItemsListState();
}

class _UserItemsListState extends State<UserItemsList>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
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
  void didUpdateWidget(UserItemsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.userItemsList != oldWidget.userItemsList) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final AdminPanelBloc adminPanelBloc = context.read<AdminPanelBloc>();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return ListenableBuilder(
      listenable: _animationController,
      builder: (_, __) {
        return FadeTransition(
          opacity: _animation,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.userItemsList.length,
            itemBuilder: (_, int index) {
              return ExpansionTile(
                title: UserItem(
                  userInfoItem: widget.userItemsList[index],
                ),
                onExpansionChanged: (bool expanded) {
                  if (expanded) {
                    adminPanelBloc.add(
                      FetchUserOrderHistoryEvent(
                          userId: widget.userItemsList[index].userId),
                    );
                  }
                },
                children: <Widget>[
                  adminPanelBloc.state.isDataProcessing
                      ? const LoadingIndicator()
                      : adminPanelBloc.state.userOrderHistory.isEmpty
                          ? SizedBox(
                              height: mediaQueryData.size.height * 0.04,
                              child: Text('userHasNoOrders'.tr()),
                            )
                          : ListOfOrderItems(
                              orderItems: adminPanelBloc.state.userOrderHistory,
                            )
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
