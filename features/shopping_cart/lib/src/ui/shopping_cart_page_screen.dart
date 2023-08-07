import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:shopping_cart/shopping_cart.dart';

class ShoppingCartPageScreen extends StatefulWidget {
  const ShoppingCartPageScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPageScreen> createState() => _ShoppingCartPageScreenState();
}

class _ShoppingCartPageScreenState extends State<ShoppingCartPageScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final NavigateToPageBloc navigateToPageBloc =
        context.read<NavigateToPageBloc>();
    final ThemeData theme = Theme.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final OrderHistoryBloc orderHistoryBloc = context.read<OrderHistoryBloc>();
    final AuthBloc authBlocBloc = context.read<AuthBloc>();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: BlocConsumer<ShoppingCartBloc, ShoppingCartState>(
        listener: (BuildContext context, ShoppingCartState state) {
          if (state.shoppingCart.addCutlery) {
            NotificationToast.showNotification(
              context,
              AppConstants.addCutleryToCart,
              mediaQueryData,
              settingsBloc,
              Icons.expand_circle_down_outlined,
              theme.canvasColor,
            );
          }
        },
        listenWhen: (ShoppingCartState previous, ShoppingCartState current) {
          return previous.shoppingCart.addCutlery !=
              current.shoppingCart.addCutlery;
        },
        builder: (BuildContext context, ShoppingCartState state) {
          if (state.shoppingCart.shoppingCartItems.isNotEmpty) {
            return Scaffold(
              bottomNavigationBar: OrderBottomBar(
                totalPrice: state.shoppingCart.totalPrice,
                onPressed: () {
                  orderHistoryBloc.add(
                    CreateOrderEvent(
                      orderItem: OrderItemModel(
                        id: orderHistoryBloc.state.orderItems.length + 1,
                        userId: authBlocBloc.state.userId,
                        shoppingCart: state.shoppingCart,
                        date: DateTime.now().toString(),
                      ),
                    ),
                  );
                  context.read<ShoppingCartBloc>().add(
                        ClearShoppingCartEvent(),
                      );
                  orderHistoryBloc.state.exception == ''
                      ? NotificationToast.showNotification(
                          context,
                          AppConstants.successfulOrder,
                          mediaQueryData,
                          settingsBloc,
                          Icons.check_circle_outline,
                          theme.canvasColor,
                        )
                      : NotificationToast.showNotification(
                          context,
                          AppConstants.unSuccessfulOrder,
                          mediaQueryData,
                          settingsBloc,
                          Icons.error_outline_rounded,
                          AppColors.errorBackgroundColor,
                        );
                },
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
            return EmptyShoppingCartScreen(
              onPressed: () {
                navigateToPageBloc.add(
                  NavigateToMainPageEvent(),
                );
              },
            );
          }
        },
      ),
    );
  }
}
