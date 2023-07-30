import 'package:auth/auth.dart';
import 'package:flutter/material.dart';

class SignUpPageScreen extends StatefulWidget {
  const SignUpPageScreen({super.key});

  @override
  State<SignUpPageScreen> createState() => _SignUpPageScreenState();
}

class _SignUpPageScreenState extends State<SignUpPageScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SignTitle(title: 'Sign Up'),
                SizedBox(height: 5),
                SignUpBlock(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
