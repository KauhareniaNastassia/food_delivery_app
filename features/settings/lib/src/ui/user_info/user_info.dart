import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class UserInfoBlock extends StatelessWidget {
  const UserInfoBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.read<AuthBloc>();
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: theme.canvasColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                Icons.person,
                color: AppColors.primaryButtonTextColor,
                size: mediaQueryData.size.height * 0.05,
              ),
            ),
            UserNameBlock(
              userName: authBloc.state.userName,
              email: authBloc.state.email,
            ),
            const SizedBox(
              height: 30,
            ),
            SignOutButton(
              onPressed: () {
                authBloc.add(
                  SignOutEvent(),
                );
              },
            ),
          ],
        ),
        Divider(
          color: theme.unselectedWidgetColor,
          thickness: 1,
        ),
      ],
    );
  }
}
