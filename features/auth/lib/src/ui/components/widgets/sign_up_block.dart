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

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state.signUpFailedMessage != '') {
          MotionToast.error(
            description: Text(
              'User with this email is already exist',
              style: AppTextStyles.size16WeightSemiBoldText(
                fontSize: settingsBloc.state.fontSize,
                color: AppColors.primaryColor,
              ),
            ),
            toastDuration: const Duration(seconds: 1),
            width: mediaQueryData.size.width * 0.9,
            height: mediaQueryData.size.height * 0.08,
            displayBorder: true,
            displaySideBar: false,
            iconSize: mediaQueryData.size.width * 0.12,
          ).show(context);
        }
      },
      listenWhen: (AuthState previous, AuthState current) {
        return previous.signUpFailedMessage != current.signUpFailedMessage;
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
                  'Sign Up',
                  style: AppTextStyles.size24WeightBoldText(
                    fontSize: settingsBloc.state.fontSize,
                    color: AppColors.secondaryColor,
                  ),
                ),
                CustomTextField(
                  label: 'Name',
                  textEditingController: _userNameController,
                  validation: (String? name) => nameValidation(name),
                  obscureText: false,
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
                SizedBox(height: mediaQueryData.size.height * 0.044),
                PrimaryButton(
                  buttonTitle: 'Sign Up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authBloc.add(
                        SignUpEvent(
                          userName: _userNameController.text.trim(),
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
