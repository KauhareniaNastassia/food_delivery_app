import 'package:core_ui/core_ui.dart';
import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final MenuItemModel menuItem;

  const MenuItem({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: size.height / 6,
              width: size.width / 1.2,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: AppStyles.largeBorderRadius,
                color: AppColors.backgroundItemColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      menuItem.title,
                      style: AppTextStyles.size18Weight600Text(
                          AppColors.titleTextColor),
                    ),
                    const SizedBox(height: 60),
                    Text(
                      "\$${menuItem.cost}",
                      style: AppTextStyles.size22Weight600Text(
                        AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 145,
            width: 140,
            decoration: BoxDecoration(
              color: AppColors.backgroundItemColor,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [AppStyles.boxShadow],
            ),
            child: ClipOval(
              child: menuItem.image == ''
                  ? const ImagePlaceholder(
                      height: 145,
                      width: 140,
                      iconData: Icons.fastfood_rounded,
                      iconSize: 50,
                    )
                  : Image.network(
                      menuItem.image,
                    ),
            ),
          ),
          //ItemListButton(onTap: () {}),
          Positioned(
            right: 5,
            bottom: 0,
            child: ItemListButton(onTap: () {}),
          )
        ],
      ),
    );
  }
}
