import 'package:flutter/material.dart';

class DecorationBlock extends StatelessWidget {
  const DecorationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          border: Border.all(
            width: 0,
            color: Theme.of(context).cardColor,
          ),
        ),
      ),
    );
  }
}
