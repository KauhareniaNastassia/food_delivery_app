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
  Widget build(BuildContext context) {
    final ShoppingCartBloc shoppingCartBloc =
        BlocProvider.of<ShoppingCartBloc>(context);
    final OrderHistoryBloc orderHistoryBloc =
        BlocProvider.of<OrderHistoryBloc>(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

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
          return Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                top: state.isUserLoggedIn ? mediaQueryData.size.height : 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/image/logo.png',
                    width: mediaQueryData.size.width * 0.5,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
