import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SignInPageScreen extends StatefulWidget {
  const SignInPageScreen({super.key});

  @override
  State<SignInPageScreen> createState() => _SignInPageScreenState();
}

class _SignInPageScreenState extends State<SignInPageScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthBloc auhBloc = context.read<AuthBloc>();
    final bool isSignInPage = auhBloc.state.isSignInPage;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SignTitle(),
                const SizedBox(
                  height: 30,
                ),
                isSignInPage ? const SignInBlock() : const SignUpBlock(),
                const SizedBox(height: 16),
                ChangeSignPageSwitch(
                  onPressed: () {
                    auhBloc.add(
                      ChangeSignPageEvent(),
                    );
                  },
                  isSignInPage: isSignInPage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
