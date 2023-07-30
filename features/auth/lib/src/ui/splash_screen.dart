import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final NavigateToPageBloc navigateToPageBloc =
        context.read<NavigateToPageBloc>();
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state.isUserLoggedIn) {
            navigateToPageBloc.add(
              NavigateToMainPageEvent(context: context),
            );
          } else {
            navigateToPageBloc.add(
              NavigateToSignInPageEvent(context: context),
            );
          }
        },
        builder: (BuildContext context, AuthState state) {
          return Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                top: authBloc.state.isUserLoggedIn
                    ? mediaQueryData.size.height
                    : 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    "assets/image/logo.png",
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
