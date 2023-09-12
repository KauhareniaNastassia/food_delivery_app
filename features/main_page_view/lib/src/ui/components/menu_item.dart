import 'package:admin_panel/admin_panel.dart';
import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
import 'package:settings/settings.dart';
import 'package:shopping_cart/shopping_cart.dart';

class MenuItem extends StatefulWidget {
  final MenuItemModel menuItem;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.menuItem,
    required this.onTap,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    final ShoppingCartBloc shoppingCartBloc = context.read<ShoppingCartBloc>();
    final AuthBloc authBloc = context.read<AuthBloc>();
    final AdminPanelBloc adminPanelBloc = context.read<AdminPanelBloc>();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final MenuBloc menuBloc = context.read<MenuBloc>();
    final bool isCustomer =
        authBloc.state.userRole == AppConstants.userRoles[0];

    ShoppingCartItemModel? findItemInShoppingCart(MenuItemModel menuItem) {
      for (final item
          in shoppingCartBloc.state.shoppingCart.shoppingCartItems) {
        if (item.menuItem == widget.menuItem) {
          return item;
        }
      }
      return null;
    }

    return BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
      builder: (BuildContext context, ShoppingCartState state) {
        return Ink(
          child: InkWell(
            borderRadius: AppStyles.largeBorderRadius,
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: <Widget>[
                  MenuItemTitle(
                    title: widget.menuItem.title,
                    cost: widget.menuItem.cost,
                  ),
                  MenuItemImage(
                    image: widget.menuItem.image,
                  ),
                  Positioned(
                    right: 5,
                    bottom: 0,
                    child: ItemListButton(
                      isCustomer: isCustomer,
                      amount: findItemInShoppingCart(widget.menuItem)?.amount,
                      onPressed: () {
                        isCustomer
                            ? shoppingCartBloc.add(
                                AddShoppingCartItemEvent(
                                  menuItem: widget.menuItem,
                                ),
                              )
                            : {
                                adminPanelBloc.add(
                                  DeleteMenuItemEvent(
                                    menuItemId: widget.menuItem.id,
                                  ),
                                ),
                                NotificationToast.showNotification(
                                  context,
                                  'menuItemWasDeleted'.tr(),
                                  mediaQueryData,
                                  settingsBloc,
                                  Icons.expand_circle_down_outlined,
                                  theme.canvasColor,
                                ),
                                menuBloc.add(
                                  InitEvent(),
                                ),
                              };
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
