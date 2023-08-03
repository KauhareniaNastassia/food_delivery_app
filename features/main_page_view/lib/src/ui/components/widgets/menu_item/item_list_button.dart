import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

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
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
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
                              size: mediaQueryData.size.width / 12,
                            ),
                            Positioned(
                              right: 6,
                              top: 0.5,
                              child: Container(
                                width: mediaQueryData.size.width * 0.05,
                                padding: const EdgeInsets.all(0),
                                child: Center(
                                  child: Text(
                                    widget.amount.toString(),
                                    style: AppTextStyles.size14WeightBoldText(
                                      color: AppColors.descriptionTextColor,
                                      fontSize: settingsBloc.state.fontSize,
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
                          size: mediaQueryData.size.width / 12,
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
