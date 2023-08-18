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
    with TickerProviderStateMixin {
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
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    final AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return FadeTransition(
      opacity: _animation,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: mediaQueryData.size.width / 1.3,
              height: mediaQueryData.size.height / 2.1,
              child: RiveAnimation.asset(
                  AnimationPathConstants.emptyShoppingCartPath),
            ),
            Text(
              appLocalization.translate('nothingInCart'),
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              buttonTitle: appLocalization.translate('goToMenu'),
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
