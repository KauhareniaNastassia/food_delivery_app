import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SignUpBlock extends StatefulWidget {
  final String email;
  final String password;

  const SignUpBlock({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<SignUpBlock> createState() => _SignUpBlockState();
}

class _SignUpBlockState extends State<SignUpBlock> {
  final TextEditingController userNameController = TextEditingController();
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
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Form(
      key: formKey,
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
            textEditingController: userNameController,
            validation: (String? name) {
              return nameValidation(name ?? '');
            },
            obscureText: false,
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
          SizedBox(height: mediaQueryData.size.height * 0.044),
          PrimaryButton(
            buttonTitle: 'signUp'.tr(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                authBloc.add(
                  SignUpEvent(
                    userName: userNameController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  ),
                );
                userNameController.clear();
                emailController.clear();
                passwordController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
