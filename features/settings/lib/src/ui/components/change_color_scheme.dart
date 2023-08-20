
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';


class ChangeColorScheme extends StatelessWidget {
  final bool isStandardColorScheme;
  final String title;
  final VoidCallback onTap;

  const ChangeColorScheme({
    super.key,
    required this.isStandardColorScheme,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: mediaQueryData.size.width * 0.55,
          child: Text(
              title,
            style: theme.textTheme.titleLarge,
          ),
        ),
        GestureDetector(
          onTap: isStandardColorScheme ? null : onTap,
          child: Container(
              width: size.width * 0.09,
              height: size.height * 0.09,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: <Color>[
                    AppColors.primaryColor,
                    AppColors.secondaryColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
              ),
              child: isStandardColorScheme
                  ? Icon(
                      Icons.check,
                      size: size.width * 0.08,
                      color: Colors.white,
                    )
                  : null),
        ),
        GestureDetector(
          onTap: isStandardColorScheme ? onTap : null,
          child: Container(
            width: size.width * 0.09,
            height: size.height * 0.09,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: <Color>[
                  AppColors.alternativePrimaryColor,
                  AppColors.alternativeSecondaryColor
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: AppColors.alternativePrimaryColor,
                width: 2,
              ),
            ),
            child: !isStandardColorScheme
                ? Icon(
                    Icons.check,
                    size: size.width * 0.08,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
