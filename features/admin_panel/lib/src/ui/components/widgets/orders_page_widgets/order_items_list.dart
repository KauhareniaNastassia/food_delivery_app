import 'package:admin_panel/admin_panel.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:order_history/order_history.dart';

class OrderItemsList extends StatefulWidget {
  final List<OrderItemForAdminModel> orderItemsList;

  const OrderItemsList({
    Key? key,
    required this.orderItemsList,
  }) : super(key: key);

  @override
  State<OrderItemsList> createState() => _OrderItemsListState();
}

class _OrderItemsListState extends State<OrderItemsList>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
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
  void didUpdateWidget(OrderItemsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.orderItemsList != oldWidget.orderItemsList) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return ListenableBuilder(
      listenable: _animationController,
      builder: (_, __) {
        if (widget.orderItemsList.isEmpty) {
          return NothingFindScreen(
            riveAnimationPath: AnimationPathConstants.allOrdersAreCompletePath,
            title: 'allOrdersAreCompleted'.tr(),
          );
        } else {
          return FadeTransition(
            opacity: _animation,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.orderItemsList.length,
              itemBuilder: (_, int index) {
                return Column(
                  children: <Widget>[
                    OrderItemForAdmin(
                      orderItemForAdmin: widget.orderItemsList[index],
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.02),
                  ],
                );
              },
            ),
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
