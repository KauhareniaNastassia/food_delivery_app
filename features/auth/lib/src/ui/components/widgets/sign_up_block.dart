import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SignUpBlock extends StatefulWidget {
  const SignUpBlock({
    super.key,
  });

  @override
  State<SignUpBlock> createState() => _SignUpBlockState();
}

class _SignUpBlockState extends State<SignUpBlock> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'signUp'.tr(),
            style: AppTextStyles.size22WeightBoldText(
              fontSize: settingsBloc.state.fontSize,
              color: AppColors.secondaryColor,
            ),
          ),
          CustomTextField(
            label: 'userName'.tr(),
            textEditingController: _userNameController,
            validation: (String? name) {
              return nameValidation(name ?? '');
            },
            obscureText: false,
          ),
          CustomTextField(
            label: 'email'.tr(),
            textEditingController: _emailController,
            validation: (String? email) {
              return emailValidation(email ?? '');
            },
            obscureText: false,
          ),
          CustomTextField(
            label: 'password'.tr(),
            textEditingController: _passwordController,
            validation: (String? password) {
              return passwordValidation(password ?? '');
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
          SizedBox(height: mediaQueryData.size.height * 0.044),
          PrimaryButton(
            buttonTitle: 'signUp'.tr(),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                authBloc.add(
                  SignUpEvent(
                    userName: _userNameController.text.trim(),
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  ),
                );
                _userNameController.clear();
                _emailController.clear();
                _passwordController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
