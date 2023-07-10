import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/shopping_cart.dart';

import 'widgets/add_to_cart_button.dart';

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
  late bool isItemInCart;

  _isItemInShoppingCart() {
    if (context
        .read<ShoppingCartBloc>()
        .state
        .shoppingCart
        .shoppingCartItems
        .any((item) => item.menuItem.id == widget.menuItem.id)) {
      isItemInCart = true;
    } else {
      isItemInCart = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _isItemInShoppingCart();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return BlocConsumer<ShoppingCartBloc, ShoppingCartState>(
      listener: (context, state) {
        _isItemInShoppingCart();
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Material(
            color: Theme.of(context).cardColor,
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: AddToCartButton(
                isItemInCart: isItemInCart,
                onPressed: () {
                  context.read<ShoppingCartBloc>().add(
                        (AddShoppingCartItemEvent(menuItem: widget.menuItem)),
                      );
                },
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                  ),
                ),
                expandedHeight: size.height * 0.4,
                flexibleSpace: Stack(
                  children: <Widget>[
                    FlexibleSpaceBar(
                      background: widget.menuItem.image.isNotEmpty
                          ? Image.network(
                              widget.menuItem.image,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  ImagePlaceholder(
                                iconData: Icons.fastfood,
                                iconSize: size.width * 0.3,
                              ),
                            )
                          : ImagePlaceholder(
                              iconData: Icons.fastfood,
                              iconSize: size.width * 0.3,
                            ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                          border: Border.all(
                            width: 0,
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(
                    30,
                    0,
                    30,
                    40,
                  ),
                  color: Theme.of(context).cardColor,
                  height: size.height * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ///title and cost
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              widget.menuItem.title,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Text(
                            '\$${widget.menuItem.cost}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),

                      ///description
                      const SizedBox(height: 20),
                      widget.menuItem.description.isNotEmpty
                          ? Text(
                              widget.menuItem.description,
                              style: Theme.of(context).textTheme.titleSmall,
                            )
                          : Center(
                              child: Text(
                                'No description available',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),

                      ///ingredients
                      const SizedBox(height: 20),
                      Text(
                        'Ingredients:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 10),
                      widget.menuItem.ingredients.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.menuItem.ingredients.length,
                              padding: const EdgeInsets.all(0),
                              itemBuilder: (context, index) {
                                return Row(
                                  children: <Widget>[
                                    const SizedBox(width: 15),
                                    const CustomDotPoint(),
                                    const SizedBox(width: 10),
                                    Text(
                                      widget.menuItem.ingredients[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                );
                              },
                            )
                          : Center(
                              child: Text(
                                'No ingredients available',
                                style: AppTextStyles.size14WeightNormalText(
                                  AppColors.primaryColor,
                                ),
                              ),
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
