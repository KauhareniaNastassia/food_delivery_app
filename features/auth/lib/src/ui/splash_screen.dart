import 'dart:ui';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:order_history/order_history.dart';
import 'package:shopping_cart/shopping_cart.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
        authBloc.add(
          InitAuthEvent(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ShoppingCartBloc shoppingCartBloc =
        BlocProvider.of<ShoppingCartBloc>(context);
    final OrderHistoryBloc orderHistoryBloc =
        BlocProvider.of<OrderHistoryBloc>(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state.isUserLoggedIn) {
            shoppingCartBloc.add(
              NavigateToMainPageEvent(),
            );
            shoppingCartBloc.add(
              InitShoppingCartEvent(),
            );
            orderHistoryBloc.add(
              InitOrderHistoryEvent(),
            );
          } else {
            context.read<AuthBloc>().add(
                  NavigateToSignInPageEvent(),
                );
          }
        },
        builder: (BuildContext context, AuthState state) {
          return Scaffold(
            backgroundColor: theme.cardColor,
            body: Stack(
              children: <Widget>[
                const RiveAnimation.asset(
                  'assets/image/rive_icons/shapes.riv',
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 30,
                      sigmaY: 30,
                    ),
                    child: const SizedBox(),
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/image/logo.png',
                    width: mediaQueryData.size.width * 0.5,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
