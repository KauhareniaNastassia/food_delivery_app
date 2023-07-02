import 'package:core/config/di/app_di.dart';
import 'package:core/core.dart';
import 'package:domain/usecases/fetch_menu_items_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:main_page_view/src/ui/components/main_page_content.dart';

import '../../../main_page.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuBloc>(
      create: (BuildContext context) => MenuBloc(
        fetchMenuItemsUseCase: instance.get<FetchMenuItemsUseCase>(),
      )..add(InitEvent()),
      child: const MainPageContent(),
    );
  }
}
