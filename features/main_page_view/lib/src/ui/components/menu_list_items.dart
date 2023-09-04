import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';

import 'menu_item.dart';

class MenuListItems extends StatefulWidget {
  final List<MenuItemModel> menu;
  final bool isCustomer;

  const MenuListItems({
    Key? key,
    required this.menu,
    required this.isCustomer,
  }) : super(key: key);

  @override
  State<MenuListItems> createState() => _MenuListItemsState();
}

class _MenuListItemsState extends State<MenuListItems>
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
  void didUpdateWidget(MenuListItems oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.menu != oldWidget.menu) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _animationController,
      builder: (BuildContext context, _) {
        return FadeTransition(
          opacity: _animation,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.menu.length,
            itemBuilder: (_, int index) {
              return OpenContainer(
                closedElevation: 0.0,
                openElevation: 0.0,
                transitionDuration: const Duration(milliseconds: 700),
                transitionType: ContainerTransitionType.fade,
                openColor: Colors.transparent,
                closedColor: Colors.transparent,
                middleColor: Colors.transparent,
                closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                closedBuilder: (_, void Function() action) {
                  return MenuItem(
                    key: ValueKey(widget.menu[index].id),
                    menuItem: widget.menu[index],
                    onTap: action,
                  );
                },
                openBuilder: (_, __) {
                  return widget.isCustomer
                      ? MenuItemDetailsScreen(
                          menuItem: widget.menu[index],
                        )
                      : MenuItemDetailsScreenForAdmin(
                          menuItem: widget.menu[index],
                        );
                },
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
