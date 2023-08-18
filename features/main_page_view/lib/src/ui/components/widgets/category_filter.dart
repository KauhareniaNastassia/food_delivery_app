import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
import 'package:settings/settings.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final MenuBloc menuBloc = context.read<MenuBloc>();

    return BlocBuilder<MenuBloc, MenuState>(
      builder: (BuildContext context, MenuState state) {
        return SizedBox(
          height: mediaQueryData.size.height * 0.05,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: AppConstants.menuItemCategory.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  menuBloc.add(
                    FilterMenuByCategoryEvent(
                      category: AppConstants.menuItemCategory[index],
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 7, right: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: menuBloc.state.selectedCategory ==
                            AppConstants.menuItemCategory[index]
                        ? theme.primaryColor
                        : theme.canvasColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: mediaQueryData.size.width * 0.04,
                      right: mediaQueryData.size.width * 0.04,
                    ),
                    child: Center(
                      child: Text(
                        AppConstants.menuItemCategory[index],
                        style: AppTextStyles.size16WeightSemiBoldText(
                          fontSize: settingsBloc.state.fontSize,
                          color: AppColors.primaryButtonTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
