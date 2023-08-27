import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class EmptyShoppingCartScreen extends StatefulWidget {
  final VoidCallback onPressed;

  const EmptyShoppingCartScreen({
    super.key,
    required this.onPressed,
  });

  @override
  State<EmptyShoppingCartScreen> createState() =>
      _EmptyShoppingCartScreenState();
}

class _EmptyShoppingCartScreenState extends State<EmptyShoppingCartScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Center(
        child: Column(
          children: <Widget>[
            NothingFindScreen(
              riveAnimationPath: AnimationPathConstants.emptyShoppingCartPath,
              title: 'nothingInCart'.tr(),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              buttonTitle: 'goToMenu'.tr(),
              onPressed: widget.onPressed,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
