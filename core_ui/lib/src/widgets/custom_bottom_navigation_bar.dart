import 'package:core/localization/app_localizations.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.fromLTRB(10, 1, 10, 5),
      height: mediaQueryData.size.height * 0.085,
      decoration: BoxDecoration(
        color: theme.bottomNavigationBarTheme.backgroundColor,
        boxShadow: [AppStyles.boxShadowForBottomBar],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: CustomBottomNavigationBarItems.listOfIcons.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: mediaQueryData.size.width * 0.024,
        ),
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () => widget.onTap(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AnimatedContainer(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.decelerate,
                  margin: EdgeInsets.only(
                    bottom: index == widget.currentIndex
                        ? 0
                        : mediaQueryData.size.width * 0.029,
                    right: mediaQueryData.size.width * 0.045,
                    left: mediaQueryData.size.width * 0.05,
                  ),
                  width: mediaQueryData.size.width * 0.128,
                  height: index == widget.currentIndex
                      ? mediaQueryData.size.width * 0.014
                      : 0,
                  decoration: BoxDecoration(
                    color: theme.bottomNavigationBarTheme.selectedItemColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Icon(
                  CustomBottomNavigationBarItems.listOfIcons[index],
                  size: mediaQueryData.size.width * 0.07,
                  color: index == widget.currentIndex
                      ? theme.bottomNavigationBarTheme.selectedItemColor
                      : theme.bottomNavigationBarTheme.unselectedItemColor,
                ),
                Text(
                  appLocalization.translate(
                    CustomBottomNavigationBarItems.listOfLabels[index],
                  ),
                  style: AppTextStyles.size12WeightSemiBoldText(
                    index == widget.currentIndex
                        ? theme.bottomNavigationBarTheme.selectedItemColor!
                        : theme.bottomNavigationBarTheme.unselectedItemColor!,
                  ),
                ),
                SizedBox(height: mediaQueryData.size.width * 0.01),
              ],
            ),
          );
        },
      ),
    );
  }
}
