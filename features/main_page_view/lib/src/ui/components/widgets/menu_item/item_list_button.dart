import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ItemListButton extends StatefulWidget {
  final VoidCallback onPressed;
  final int? amount;
  final bool isCustomer;

  const ItemListButton({
    Key? key,
    required this.onPressed,
    required this.amount,
    required this.isCustomer,
  }) : super(key: key);

  @override
  ItemListButtonState createState() => ItemListButtonState();
}

class ItemListButtonState extends State<ItemListButton> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Ink(
      child: InkWell(
        child: CircleAvatar(
          minRadius: 13,
          backgroundColor: widget.amount != null && widget.isCustomer
              ? Theme.of(context).canvasColor
              : Theme.of(context).primaryColor,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: widget.onPressed,
              icon: widget.amount != null && widget.isCustomer
                  ? Stack(
                      children: <Widget>[
                        Icon(
                          Icons.shopping_cart,
                          color: AppColors.primaryButtonTextColor,
                          size: mediaQueryData.size.width / 12,
                        ),
                        Positioned(
                          right: mediaQueryData.size.width * 0.015,
                          top: mediaQueryData.size.height * 0.001,
                          child: Container(
                            width: mediaQueryData.size.width * 0.05,
                            padding: const EdgeInsets.all(0),
                            child: Center(
                              child: Text(
                                widget.amount.toString(),
                                style: AppTextStyles.size14WeightBoldText(
                                  color: AppColors.descriptionTextColor,
                                  fontSize: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Icon(
                      widget.isCustomer
                          ? Icons.shopping_cart_outlined
                          : Icons.delete_outline_rounded,
                      color: AppColors.primaryButtonTextColor,
                      size: mediaQueryData.size.width / 12,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
