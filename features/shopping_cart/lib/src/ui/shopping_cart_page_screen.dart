import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/src/ui/shopping_cart_list_items.dart';
import 'package:shopping_cart/src/ui/widgets/switch_for_cutlery.dart';

import '../bloc/bloc.dart';
import 'empty_shopping_cart_screen.dart';
import 'widgets/order_bottom_bar.dart';

class ShoppingCartPageScreen extends StatefulWidget {
  const ShoppingCartPageScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPageScreen> createState() => _ShoppingCartPageScreenState();
}

class _ShoppingCartPageScreenState extends State<ShoppingCartPageScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
        builder: (BuildContext context, ShoppingCartState state) {
          if (state.shoppingCart.shoppingCartItems.isNotEmpty) {
            return Scaffold(
              bottomNavigationBar: OrderBottomBar(
                totalPrice: state.shoppingCart.totalPrice,
              ),
              body: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: <Widget>[
                      SwitchForCutlery(
                        switchValue: state.shoppingCart.addCutlery,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: <Widget>[
                          ShoppingCartListItems(
                            shoppingCart: state.shoppingCart,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const EmptyShoppingCartScreen();
          }
        },
      ),
    );
  }
}
