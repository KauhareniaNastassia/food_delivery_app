import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';

class SignInPageScreen extends StatefulWidget {
  const SignInPageScreen({super.key});

  @override
  State<SignInPageScreen> createState() => _SignInPageScreenState();
}

class _SignInPageScreenState extends State<SignInPageScreen> {
  @override
  Widget build(BuildContext context) {
    final NavigateToPageBloc navigateToPageBloc =
        context.read<NavigateToPageBloc>();
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SignTitle(title: 'Sign In'),
                const SizedBox(height: 20),
                const SignInBlock(),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account?',
                      style: theme.textTheme.titleSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        navigateToPageBloc.add(
                          NavigateToSignUpPageEvent(context: context),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
