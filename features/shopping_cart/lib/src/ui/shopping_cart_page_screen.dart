import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
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
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();

    return SafeArea(
      child: BlocConsumer<ShoppingCartBloc, ShoppingCartState>(
        listener: (BuildContext context, ShoppingCartState state) {
          if (state.shoppingCart.addCutlery) {
            MotionToast(
              icon: Icons.expand_circle_down_outlined,
              description: Text(
                'The cost of cutlery is 0.5\$',
                style: AppTextStyles.size18WeightSemiBoldText(
                  fontSize: settingsBloc.state.fontSize,
                  color: theme.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              toastDuration: const Duration(seconds: 2),
              width: size.width * 0.9,
              height: size.height * 0.07,
              displayBorder: true,
              displaySideBar: false,
              iconSize: size.width * 0.13,
              primaryColor: theme.canvasColor,
            ).show(context);
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
                  NavigateToMainPageEvent( context: context),
                );
              },
            );
          }
        },
      ),
    );
  }
}
