import 'package:core/core.dart';
import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';

import 'menu_item.dart';

class MenuListItems extends StatelessWidget {
  final List<MenuItemModel> menu;

  const MenuListItems({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: menu.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: MenuItem(
            key: ValueKey(menu[index].id),
            menuItem: menu[index],
            onTap: () {
              context.read<MenuBloc>().add(
                    NavigateToMenuItemEvent(
                      menuItem: menu[index],
                    ),
                  );
            },
          ),
        );
      },
    );
  }
}
