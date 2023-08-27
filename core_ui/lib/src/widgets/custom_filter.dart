import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class CustomFilter extends StatelessWidget {
  final List<String> filterItems;
  final String selectedFilter;
  final Function(String) onTap;

  const CustomFilter({
    super.key,
    required this.filterItems,
    required this.selectedFilter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();

    return SizedBox(
      height: mediaQueryData.size.height * 0.05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filterItems.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () => onTap(filterItems[index]),
            child: Container(
              margin: const EdgeInsets.only(left: 6, right: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                border: Border.all(
                  color: selectedFilter == filterItems[index]
                      ? theme.primaryColor
                      : theme.canvasColor,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: mediaQueryData.size.width * 0.04,
                  right: mediaQueryData.size.width * 0.04,
                ),
                child: Center(
                  child: Text(
                    filterItems[index],
                    style: AppTextStyles.size16WeightSemiBoldText(
                      fontSize: settingsBloc.state.fontSize,
                      color: selectedFilter == filterItems[index]
                          ? theme.primaryColor
                          : theme.canvasColor,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
