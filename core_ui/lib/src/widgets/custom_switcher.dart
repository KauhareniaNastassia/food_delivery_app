import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class CustomSwitcher extends StatelessWidget {
  final bool toggle;
  final VoidCallback onTap;

  const CustomSwitcher({
    super.key,
    required this.toggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    final MovieTween customTween = MovieTween()
      ..scene(
        duration: const Duration(seconds: 1),
      ).tween(
        CustomSwitcherEnum.paddingLeft,
        0.0.tweenTo(60.0),
      )
      ..scene(
        duration: const Duration(seconds: 1),
      ).tween(
        CustomSwitcherEnum.color,
        theme.primaryColor.tweenTo(theme.canvasColor),
      )
      ..scene(
        duration: const Duration(milliseconds: 500),
      )
          .tween(
            CustomSwitcherEnum.icon,
            ConstantTween('assets/image/spanish_flag.svg'),
          )
          .thenTween(
            CustomSwitcherEnum.icon,
            ConstantTween('assets/image/british_flag.svg'),
            duration: const Duration(milliseconds: 500),
          )
      ..scene(
        duration: const Duration(seconds: 1),
      ).tween(
        CustomSwitcherEnum.rotation,
        (-2 * pi).tweenTo(0.0),
      );

    return GestureDetector(
      onTap: onTap,
      child: CustomAnimationBuilder<Movie>(
        control: toggle ? Control.play : Control.playReverse,
        startPosition: toggle ? 1.0 : 0.0,
        key: const Key('0'),
        duration: customTween.duration * 1.2,
        tween: customTween,
        curve: Curves.easeInOut,
        builder: (_, Movie value, __) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              border: Border.all(
                width: 2,
                color: value.get(CustomSwitcherEnum.color),
              ),
            ),
            width: mediaQueryData.size.width * 0.26,
            height: mediaQueryData.size.height * 0.055,
            padding: const EdgeInsets.all(4),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: value.get(CustomSwitcherEnum.paddingLeft),
                    ),
                    child: Transform.rotate(
                      angle: value.get(CustomSwitcherEnum.rotation),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          color: value.get(CustomSwitcherEnum.color),
                        ),
                        width: 30,
                        child: Center(
                          child: SvgPicture.asset(
                            value.get(CustomSwitcherEnum.icon),
                            width: 29,
                            height: 29,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
