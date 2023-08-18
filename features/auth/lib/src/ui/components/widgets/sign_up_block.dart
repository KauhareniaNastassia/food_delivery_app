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
    final AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state.signUpFailedMessage != '') {
          NotificationToast.showNotification(
            context,
            state.signUpFailedMessage! ==
                    ErrorConstants.userAlreadyExistResponseError
                ? appLocalization.translate('userAlreadyExistError')
                : appLocalization.translate('somethingWentWrongError'),
            mediaQueryData,
            settingsBloc,
            Icons.error_outline_rounded,
            AppColors.errorBackgroundColor,
          );
        }
      },
      listenWhen: (AuthState previous, AuthState current) {
        return previous.signUpFailedMessage != current.signUpFailedMessage;
      },
      builder: (BuildContext context, AuthState state) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                appLocalization.translate('signUp'),
                style: AppTextStyles.size24WeightBoldText(
                  fontSize: settingsBloc.state.fontSize,
                  color: AppColors.secondaryColor,
                ),
              ),
              CustomTextField(
                label: appLocalization.translate('userName'),
                textEditingController: _userNameController,
                validation: (String? name) {
                  return nameValidation(
                    name: name,
                    appLocalization: appLocalization,
                  );
                },
                obscureText: false,
              ),
              CustomTextField(
                label: appLocalization.translate('email'),
                textEditingController: _emailController,
                validation: (String? email) {
                  return emailValidation(
                    email: email,
                    appLocalization: appLocalization,
                  );
                },
                obscureText: false,
              ),
              CustomTextField(
                label: appLocalization.translate('password'),
                textEditingController: _passwordController,
                validation: (String? password) {
                  return passwordValidation(
                    password: password,
                    appLocalization: appLocalization,
                  );
                },
                obscureText: true,
              ),
              SizedBox(height: mediaQueryData.size.height * 0.044),
              PrimaryButton(
                buttonTitle: appLocalization.translate('signUp'),
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
      },
    );
  }
}
