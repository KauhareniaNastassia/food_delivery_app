import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SignInBlock extends StatefulWidget {
  final String email;
  final String password;

  const SignInBlock({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<SignInBlock> createState() => _SignInBlockState();
}

class _SignInBlockState extends State<SignInBlock> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordController.text = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final AuthBloc authBloc = context.read<AuthBloc>();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Form(
      key: formKey,
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
            textEditingController: emailController,
            validation: (String? email) {
              return emailValidation(email ?? '');
            },
            obscureText: false,
          ),
          CustomTextField(
            label: 'password'.tr(),
            textEditingController: passwordController,
            validation: (String? password) {
              return passwordValidation(password ?? '');
            },
            obscureText: authBloc.state.isTextObscured,
            onPressed: () {
              authBloc.add(
                ObscurePasswordEvent(),
              );
            },
          ),
          SizedBox(height: mediaQueryData.size.height * 0.05),
          PrimaryButton(
            buttonTitle: 'signIn'.tr(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                authBloc.add(
                  SignInEvent(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  ),
                );
                emailController.clear();
                passwordController.clear();
              }
            },
          ),
          //SizedBox(height: mediaQueryData.size.height * 0.05),
          SizedBox(height: mediaQueryData.size.height * 0.05),
          PrimaryButton(
            buttonTitle: 'signInViaGoogle'.tr(),
            onPressed: () {
              authBloc.add(
                SignInViaGoogleEvent(),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
