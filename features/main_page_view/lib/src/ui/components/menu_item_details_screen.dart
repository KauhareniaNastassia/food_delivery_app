import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
import 'package:shopping_cart/shopping_cart.dart';

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
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
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
                      NavigateBackEvent(),
                    );
                  },
                ),
                expandedHeight: mediaQueryData.size.height * 0.4,
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
                  color: theme.cardColor,
                  height: mediaQueryData.size.height * 0.7,
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
