import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ItemListButton extends StatefulWidget {
  final VoidCallback onPressed;
  final int? amount;

  const ItemListButton({
    Key? key,
    required this.onPressed,
    required this.amount,
  }) : super(key: key);

  @override
  ItemListButtonState createState() => ItemListButtonState();
}

class ItemListButtonState extends State<ItemListButton> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Ink(
      child: InkWell(
        child: CircleAvatar(
          minRadius: 13,
          backgroundColor: widget.amount != null
              ? Theme.of(context).canvasColor
              : Theme.of(context).primaryColor,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: widget.onPressed,
              icon: Stack(
                children: <Widget>[
                  widget.amount != null
                      ? Stack(
                          children: <Widget>[
                            Icon(
                              Icons.shopping_cart,
                              color: AppColors.primaryButtonTextColor,
                              size: size.width / 12,
                            ),
                            Positioned(
                              right: 6,
                              top: 1.5,
                              child: Container(
                                width: size.width * 0.05,
                                padding: const EdgeInsets.all(0),
                                child: Center(
                                  child: Text(
                                    widget.amount.toString(),
                                    style: AppTextStyles.size14WeightBoldText(
                                      AppColors.descriptionTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors.primaryButtonTextColor,
                          size: size.width / 12,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
