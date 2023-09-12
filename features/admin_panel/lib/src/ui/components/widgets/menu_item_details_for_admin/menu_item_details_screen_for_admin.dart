import 'package:admin_panel/admin_panel.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
import 'package:settings/settings.dart';

class MenuItemDetailsScreenForAdmin extends StatefulWidget {
  final MenuItemModel menuItem;

  const MenuItemDetailsScreenForAdmin({
    Key? key,
    required this.menuItem,
  }) : super(key: key);

  @override
  State<MenuItemDetailsScreenForAdmin> createState() =>
      _MenuItemDetailsScreenForAdminState();
}

class _MenuItemDetailsScreenForAdminState
    extends State<MenuItemDetailsScreenForAdmin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final List<TextEditingController> listOfIngredientControllers = [];
  final TextEditingController newCategoryController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initTextControllers();
  }

  void initTextControllers() {
    listOfIngredientControllers.clear();
    titleController.text = widget.menuItem.title;
    categoryController.text = widget.menuItem.category;
    costController.text = widget.menuItem.cost.toString();
    descriptionController.text = widget.menuItem.description;
    listOfIngredientControllers.addAll(
      widget.menuItem.ingredients.map(
        (String ingredient) => TextEditingController(text: ingredient),
      ),
    );
  }

  void addIngredientController(TextEditingController textEditorController) {
    setState(() {
      listOfIngredientControllers.insert(0, textEditorController);
    });
  }

  void removeIngredientController(int index) {
    setState(() {
      listOfIngredientControllers[index].clear();
      listOfIngredientControllers[index].dispose();
      listOfIngredientControllers.removeAt(index);
    });
  }

  void onChangeCategory(String? value) {
    setState(() {
      categoryController.text = value ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    final AdminPanelBloc adminPanelBloc = context.read<AdminPanelBloc>();
    final MenuBloc menuBloc = context.read<MenuBloc>();
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();

    adminPanelBloc.add(InitMenuItem(menuItem: widget.menuItem));

    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
      builder: (BuildContext context, AdminPanelState state) {
        return Form(
          key: _formKey,
          child: Scaffold(
            bottomNavigationBar: MenuItemDetailsBottomBarForAdmin(
              isEditingMode: adminPanelBloc.state.isItemEditing,
              onPressCancel: () {
                if (state.menuItem.id.isEmpty) {
                  adminPanelBloc.add(
                    const NavigateBackToAdminEvent(),
                  );
                } else {
                  initTextControllers();
                  adminPanelBloc.add(
                    const EditModeEvent(modeValue: false),
                  );
                }
              },
              onPressedEditMode: () {
                adminPanelBloc.add(
                  const EditModeEvent(modeValue: true),
                );
              },
              onPressedSave: () {
                if (_formKey.currentState!.validate()) {
                  final MenuItemModel menuItem = MenuItemModel(
                    id: state.menuItem.id,
                    category: newCategoryController.text.isEmpty
                        ? categoryController.text
                        : newCategoryController.text,
                    cost: double.parse(costController.text),
                    image: state.menuItem.image,
                    title: titleController.text,
                    description: descriptionController.text,
                    ingredients: listOfIngredientControllers
                        .map((TextEditingController ingredientController) =>
                            ingredientController.text)
                        .toList(),
                  );
                  adminPanelBloc.add(
                    SaveMenuItemChangesEvent(
                      menuItem: menuItem,
                      onComplete: () {
                        menuBloc.add(
                          InitEvent(),
                        );
                      },
                    ),
                  );
                  NotificationToast.showNotification(
                    context,
                    'changesAreSaved'.tr(),
                    mediaQueryData,
                    settingsBloc,
                    Icons.expand_circle_down_outlined,
                    theme.canvasColor,
                  );
                }
              },
            ),
            body: CustomScrollView(
              slivers: <Widget>[
                MenuItemDetailsImageForAdmin(
                  isNewImageUploaded:
                      adminPanelBloc.state.uploadedMenuItemImage == '',
                  image: state.menuItem.image,
                  isEditMode: adminPanelBloc.state.isItemEditing,
                  onPressed: () {
                    adminPanelBloc.add(
                      const NavigateBackToAdminEvent(),
                    );
                  },
                  onPressedAddNewImage: () {
                    adminPanelBloc.add(
                      const SelectMenuItemImageEvent(),
                    );
                  },
                ),
                MenuItemDetailsContentForAdmin(
                  titleController: titleController,
                  costController: costController,
                  selectedCategory: categoryController.text,
                  menuItemCategories: [
                    AppConstants.noCategory,
                    ...menuBloc.state.menuItemCategories
                  ],
                  newCategoryController: newCategoryController,
                  categoryController: categoryController,
                  descriptionController: descriptionController,
                  listOfIngredientControllers: listOfIngredientControllers,
                  onChangeCategory: onChangeCategory,
                  addIngredientController: addIngredientController,
                  removeIngredientController: removeIngredientController,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    costController.dispose();
    descriptionController.dispose();
    newCategoryController.dispose();
    categoryController.dispose();

    for (TextEditingController controller in listOfIngredientControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
