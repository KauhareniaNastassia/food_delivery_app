import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel/admin_panel.dart';

class AddIngredientTextField extends StatefulWidget {
  final void Function(TextEditingController) addIngredientController;

  const AddIngredientTextField({
    super.key,
    required this.addIngredientController,
  });

  @override
  State<AddIngredientTextField> createState() => _AddIngredientTextFieldState();
}

class _AddIngredientTextFieldState extends State<AddIngredientTextField> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController ingredientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Column(
      children: <Widget>[
        Form(
          key: formKey,
          child: Row(
            children: <Widget>[
              Expanded(
                child: MenuItemTextField(
                  label: 'addIngredient'.tr(),
                  textEditingController: ingredientController,
                  width: mediaQueryData.size.width * 0.57,
                  validation: (String? ingredient) {
                    return menuItemIngredientValidation(ingredient);
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final TextEditingController newIngredientController =
                        TextEditingController(
                      text: ingredientController.text,
                    );
                    widget.addIngredientController(newIngredientController);
                    ingredientController.clear();
                  }
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        SizedBox(height: mediaQueryData.size.height * 0.05),
      ],
    );
  }

  @override
  void dispose() {
    ingredientController.dispose();
    super.dispose();
  }
}
