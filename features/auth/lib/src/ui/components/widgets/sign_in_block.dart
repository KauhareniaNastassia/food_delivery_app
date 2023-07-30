import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SignInBlock extends StatefulWidget {
  const SignInBlock({super.key});

  @override
  State<SignInBlock> createState() => _SignInBlockState();
}

class _SignInBlockState extends State<SignInBlock> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state.signInFailedMessage != '') {
          MotionToast.error(
            description: Text(
              'Wrong email or password.',
              style: AppTextStyles.size16WeightSemiBoldText(
                fontSize: settingsBloc.state.fontSize,
                color: AppColors.primaryColor,
              ),
            ),
            toastDuration: const Duration(seconds: 1),
            width: mediaQueryData.size.width * 0.9,
            height: mediaQueryData.size.height * 0.07,
            displayBorder: true,
            displaySideBar: false,
            iconSize: mediaQueryData.size.width * 0.12,
          ).show(context);
        }
      },
      listenWhen: (AuthState previous, AuthState current) {
        return previous.signInFailedMessage != current.signInFailedMessage;
      },
      builder: (BuildContext context, AuthState state) {
        if (state.isDataProcessing) {
          return SizedBox(
            height: mediaQueryData.size.height * 0.3,
            child: const LoadingIndicator(),
          );
        } else {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomTextField(
                  label: 'Email',
                  textEditingController: _emailController,
                  validation: (String? email) => emailValidation(email),
                  obscureText: false,
                ),
                CustomTextField(
                  label: 'Password',
                  textEditingController: _passwordController,
                  validation: (String? password) =>
                      passwordValidation(password),
                  obscureText: true,
                ),
                SizedBox( height: mediaQueryData.size.height * 0.05),
                PrimaryButton(
                  buttonTitle: 'Sign In',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                            SignInEvent(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            ),
                          );
                    }
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
