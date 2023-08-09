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
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const AuthTitle(),
                    const SizedBox(height: 30),
                    state.isSignInPage
                        ? const SignInBlock()
                        : const SignUpBlock(),
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
