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
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'signIn'.tr(),
            style: AppTextStyles.size22WeightBoldText(
              fontSize: settingsBloc.state.fontSize,
              color: AppColors.secondaryColor,
            ),
          ),
          CustomTextField(
            label: 'email'.tr(),
            textEditingController: _emailController,
            validation: (String? email) {
              return emailValidation(email: email);
            },
            obscureText: false,
          ),
          CustomTextField(
            label: 'password'.tr(),
            textEditingController: _passwordController,
            validation: (String? password) {
              return passwordValidation(password: password);
            },
            obscureText: obscurePassword,
            onPressed: () {
              setState(
                () {
                  obscurePassword = !obscurePassword;
                },
              );
            },
          ),
          SizedBox(height: mediaQueryData.size.height * 0.05),
          PrimaryButton(
            buttonTitle: 'signIn'.tr(),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(
                      SignInEvent(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      ),
                    );
                _emailController.clear();
                _passwordController.clear();
              }
            },
          ),
          SizedBox(height: mediaQueryData.size.height * 0.05),
          PrimaryButton(
            buttonTitle: 'signInViaGoogle'.tr(),
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
}
