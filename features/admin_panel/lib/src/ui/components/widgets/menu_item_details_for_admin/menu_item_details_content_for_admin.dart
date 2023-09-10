import 'package:admin_panel/admin_panel.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MenuItemDetailsContentForAdmin extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController costController;
  final String selectedCategory;
  final TextEditingController descriptionController;
  final List<TextEditingController> listOfIngredientControllers;
  final Function(String?) onChangeCategory;
  final void Function(TextEditingController) addIngredientController;
  final void Function(int) removeIngredientController;

  const MenuItemDetailsContentForAdmin({
    super.key,
    required this.titleController,
    required this.costController,
    required this.selectedCategory,
    required this.onChangeCategory,
    required this.descriptionController,
    required this.listOfIngredientControllers,
    required this.addIngredientController,
    required this.removeIngredientController,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AdminPanelBloc adminPanelBloc = context.read<AdminPanelBloc>();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          left: mediaQueryData.size.width * 0.06,
          right: mediaQueryData.size.width * 0.06,
          bottom: mediaQueryData.size.height * 0.02,
        ),
        color: theme.cardColor,
        child: adminPanelBloc.state.isDataProcessing
            ? SizedBox(
                height: mediaQueryData.size.height * 0.5,
                child: const LoadingIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: mediaQueryData.size.height * 0.03),
                  MenuItemDetailsTitleForAdmin(
                    titleController: titleController,
                    costController: costController,
                    isEditMode: adminPanelBloc.state.isItemEditing,
                    title: titleController.text,
                    cost: costController.text,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.03),
                  MenuItemDetailsCategoryForAdmin(
                    category: selectedCategory,
                    isEditMode: adminPanelBloc.state.isItemEditing,
                    onChange: onChangeCategory,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.03),
                  MenuItemDetailsDescriptionForAdmin(
                    descriptionController: descriptionController,
                    description: descriptionController.text,
                    isEditMode: adminPanelBloc.state.isItemEditing,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.03),
                  MenuItemDetailsIngredientsForAdmin(
                    ingredients: listOfIngredientControllers
                        .map(
                            (ingredientController) => ingredientController.text)
                        .toList(),
                    isEditMode: adminPanelBloc.state.isItemEditing,
                    listOfIngredientControllers: listOfIngredientControllers,
                    addIngredientController: addIngredientController,
                    removeIngredientController: removeIngredientController,
                  ),
                ],
              ),
      ),
    );
  }
}
