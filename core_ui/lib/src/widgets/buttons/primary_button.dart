import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final VoidCallback onTap;
  final String buttonTitle;

  const PrimaryButton({
    Key? key,
    required this.onTap,
    required this.buttonTitle,
  }) : super(key: key);

  @override
  PrimaryButtonState createState() => PrimaryButtonState();
}

class PrimaryButtonState extends State<PrimaryButton> {
  bool _isPressed = false;

  void _toggleButton() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        onTap: () {
          widget.onTap();
          _toggleButton();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
          child: Text(
            widget.buttonTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.size22WeightSemiBoldText(
              AppColors.primaryButtonTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
