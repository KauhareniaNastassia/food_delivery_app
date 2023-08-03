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
          NotificationToast.showNotification(
            context,
            state.signInFailedMessage!,
            mediaQueryData,
            settingsBloc,
            Icons.error_outline_rounded,
            AppColors.errorBackgroundColor,
          );
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
                Text(
                  'Sign In',
                  style: AppTextStyles.size24WeightBoldText(
                    fontSize: settingsBloc.state.fontSize,
                    color: AppColors.secondaryColor,
                  ),
                ),
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
                SizedBox(height: mediaQueryData.size.height * 0.05),
                PrimaryButton(
                  buttonTitle: 'Sign in',
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
                SizedBox(height: mediaQueryData.size.height * 0.05),
                PrimaryButton(
                  buttonTitle: 'Sign in via Google',
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          SignInViaGoogleEvent(),
                        );
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
