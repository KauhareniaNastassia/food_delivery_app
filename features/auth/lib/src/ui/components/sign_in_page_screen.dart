import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SignInPageScreen extends StatefulWidget {
  const SignInPageScreen({super.key});

  @override
  State<SignInPageScreen> createState() => _SignInPageScreenState();
}

class _SignInPageScreenState extends State<SignInPageScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (BuildContext context, AuthState state) {
          return FadeTransition(
            opacity: _animation,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const AuthTitle(),
                      state.isDataProcessing
                          ? SizedBox(
                              height: mediaQueryData.size.height * 0.6,
                              child: const LoadingIndicator(),
                            )
                          : Column(
                              children: <Widget>[
                                AnimatedCrossFade(
                                  firstCurve: Curves.easeOutBack,
                                  secondCurve: Curves.easeInBack,
                                  firstChild: const SignInBlock(),
                                  secondChild: const SignUpBlock(),
                                  crossFadeState: state.isSignInPage
                                      ? CrossFadeState.showFirst
                                      : CrossFadeState.showSecond,
                                  duration: const Duration(milliseconds: 900),
                                ),
                                const SizedBox(height: 16),
                                AuthPageSwitcher(
                                  onPressed: () {
                                    context.read<AuthBloc>().add(
                                          ChangeAuthPageEvent(),
                                        );
                                  },
                                  isSignInPage: state.isSignInPage,
                                ),
                              ],
                            )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
