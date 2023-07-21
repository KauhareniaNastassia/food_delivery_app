import 'package:core/core.dart';
import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:domain/models/shopping_cart_model/shopping_cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/src/ui/components/widgets/menu_item_details/back_to_previous_page_button.dart';
import 'package:main_page_view/src/ui/components/widgets/menu_item_details/decoration_block.dart';
import 'package:main_page_view/src/ui/components/widgets/menu_item_details/menu_item_details_bottom_bar.dart';
import 'package:main_page_view/src/ui/components/widgets/menu_item_details/menu_item_details_description.dart';
import 'package:main_page_view/src/ui/components/widgets/menu_item_details/menu_item_details_image.dart';
import 'package:main_page_view/src/ui/components/widgets/menu_item_details/menu_item_details_ingredients.dart';
import 'package:main_page_view/src/ui/components/widgets/menu_item_details/menu_item_details_title.dart';
import 'package:shopping_cart/shopping_cart.dart';

import '../../../main_page.dart';

class MenuItemDetailsScreen extends StatefulWidget {
  final MenuItemModel menuItem;

  const MenuItemDetailsScreen({
    super.key,
    required this.menuItem,
  });

  @override
  State<MenuItemDetailsScreen> createState() => _MenuItemDetailsScreenState();
}

class _MenuItemDetailsScreenState extends State<MenuItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ShoppingCartBloc shoppingCartBloc = context.read<ShoppingCartBloc>();
    final NavigateToPageBloc navigateToPageBloc =
        context.read<NavigateToPageBloc>();

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
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: MenuItemDetailsBottomBar(
            amount: findItemInShoppingCart(widget.menuItem)?.amount,
            onPressed: () {
              shoppingCartBloc.add(
                AddShoppingCartItemEvent(
                  menuItem: widget.menuItem,
                ),
              );
            },
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: BackToPreviousPageButton(
                  onPressed: () {
                    navigateToPageBloc.add(
                      NavigateBackEvent(
                        context: context,
                      ),
                    );
                  },
                ),
                expandedHeight: size.height * 0.4,
                flexibleSpace: Stack(
                  children: <Widget>[
                    FlexibleSpaceBar(
                      background: MenuItemDetailsImage(
                        image: widget.menuItem.image,
                      ),
                    ),
                    const DecorationBlock(),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
                  color: Theme.of(context).cardColor,
                  height: size.height * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      MenuItemDetailsTitle(
                        title: widget.menuItem.title,
                        cost: widget.menuItem.cost,
                      ),
                      const SizedBox(height: 20),
                      MenuItemDetailsDescription(
                        description: widget.menuItem.description,
                      ),
                      const SizedBox(height: 20),
                      MenuItemDetailsIngredients(
                        ingredients: widget.menuItem.ingredients,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
