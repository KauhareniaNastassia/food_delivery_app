import 'package:core/core.dart';
import 'package:settings/settings.dart';
import 'package:flutter/material.dart';

class ContactLinksView extends StatelessWidget {
  const ContactLinksView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    final AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return BlocProvider<OpenContactLinksBloc>(
      create: (_) => OpenContactLinksBloc(),
      child: BlocBuilder<OpenContactLinksBloc, OpenContactLinksState>(
        builder: (BuildContext context, OpenContactLinksState state) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  appLocalization.translate('contactViaLinks'),
                  style: theme.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        context.read<OpenContactLinksBloc>().add(
                              OpenFacebookEvent(),
                            );
                      },
                      icon: SvgPicture.asset(
                        'assets/image/facebook_icon.svg',
                        width: size.width / 9,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<OpenContactLinksBloc>().add(
                              OpenInstagramEvent(),
                            );
                      },
                      icon: SvgPicture.asset(
                        'assets/image/instagram_icon.svg',
                        width: size.width / 8,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<OpenContactLinksBloc>().add(
                              OpenMessengerEvent(),
                            );
                      },
                      icon: SvgPicture.asset(
                        'assets/image/message_icon.svg',
                        width: size.width / 8,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<OpenContactLinksBloc>().add(
                              MakeAPhoneCallEvent(),
                            );
                      },
                      icon: SvgPicture.asset(
                        'assets/image/phone_icon.svg',
                        width: size.width / 8,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<OpenContactLinksBloc>().add(
                              OpenLocationLinkEvent(),
                            );
                      },
                      icon: SvgPicture.asset(
                        'assets/image/location_icon.svg',
                        width: size.width / 9,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


