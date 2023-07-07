import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/src/ui/shopping_cart_list_items.dart';

import '../bloc/bloc.dart';
import 'order_bottom_bar.dart';

class ShoppingCartPageScreen extends StatefulWidget {
  const ShoppingCartPageScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPageScreen> createState() =>
      _ShoppingCartPageScreenState();
}

class _ShoppingCartPageScreenState extends State<ShoppingCartPageScreen> {



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const OrderBottomBar(),
        body: Container (
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                builder: (BuildContext context, ShoppingCartState state) {
                  if (state is ShoppingCartLoadingState) {
                    return const Center(child: LoadingIndicator());
                  }
                  if (state is ShoppingCartLoadedState) {
                    return ShoppingCartListItems(
                      shoppingCartItems: state.shoppingCartItems,
                    );
                  } else {
                    return const Text('Error loading dishes');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );

    /* */
  }
}
