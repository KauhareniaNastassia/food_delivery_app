import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';

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
  final TextEditingController newIngredientController = TextEditingController();

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
                  textEditingController: newIngredientController,
                  width: mediaQueryData.size.width * 0.57,
                  validation: (String? ingredient) {
                    return menuItemIngredientValidation(ingredient: ingredient);
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final TextEditingController newOneIngredientController =
                        TextEditingController(
                      text: newIngredientController.text,
                    );
                    widget.addIngredientController(newOneIngredientController);
                    newIngredientController.clear();
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
    newIngredientController.dispose();
    super.dispose();
  }
}
