import 'package:core_ui/core_ui.dart';
import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:flutter/material.dart';

import 'item_list_button.dart';

class MenuItem extends StatelessWidget {
  final MenuItemModel menuItemModel;
  final VoidCallback onTap;

  const MenuItem({
    Key? key,
    required this.menuItemModel,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Ink(
      child: InkWell(
        borderRadius: AppStyles.largeBorderRadius,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: size.height / 6,
                  width: size.width / 1.2,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: AppStyles.largeBorderRadius,
                    color: Theme.of(context).cardColor,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          menuItemModel.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          "\$${menuItemModel.cost}",
                          style: AppTextStyles.size22WeightSemiBoldText(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height / 6,
                width: size.width / 2.8,
                decoration: BoxDecoration(
                  color: AppColors.backgroundItemColor,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [AppStyles.boxShadow],
                ),
                child: ClipOval(
                  child: menuItemModel.image == ''
                      ? const ImagePlaceholder(
                          iconData: Icons.fastfood_rounded,
                          iconSize: 50,
                        )
                      : Image.network(
                          menuItemModel.image,
                        ),
                ),
              ),
              Positioned(
                right: 5,
                bottom: 0,
                child: ItemListButton(onTap: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
