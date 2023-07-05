import 'package:core_ui/core_ui.dart';
import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:flutter/material.dart';

class MenuItemDetailsScreen extends StatelessWidget {
  final MenuItemModel menuItem;

  const MenuItemDetailsScreen({
    required this.menuItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Material(
          color: Theme.of(context).cardColor, // Replace with desired color
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
            child: PrimaryButton(
              buttonTitle: "Add to cart",
              onTap: () {},
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                ),
              ),
              expandedHeight: size.height * 0.4,
              flexibleSpace: Stack(
                children: [
                  FlexibleSpaceBar(
                    background: menuItem.image != ''
                        ? Image.network(
                            menuItem.image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                ImagePlaceholder(
                              iconData: Icons.fastfood,
                              iconSize: size.width * 0.3,
                            ),
                          )
                        : ImagePlaceholder(
                            iconData: Icons.fastfood,
                            iconSize: size.width * 0.3,
                          ),
                  ),
                  Align(
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
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.fromLTRB(
                  30,
                  0,
                  30,
                  40,
                ),
                color: Theme.of(context).cardColor,
                height: size.height * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            menuItem.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Text(
                          "\$${menuItem.cost}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),

                    ///description
                    const SizedBox(height: 20),
                    menuItem.description != '' &&
                            menuItem.description.isNotEmpty
                        ? Text(
                            menuItem.description,
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        : Center(
                            child: Text(
                              "No description available",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                    const SizedBox(height: 20),

                    ///ingredients
                    Text(
                      'Ingredients:',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    menuItem.ingredients.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: menuItem.ingredients.length,
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  const SizedBox(width: 15),
                                  const CustomDotPoint(),
                                  const SizedBox(width: 10),
                                  Text(
                                    menuItem.ingredients[index],
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              "No ingredients available",
                              style: AppTextStyles.size14WeightNormalText(
                                AppColors.primaryColor,
                              ),
                            ),
                          ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
