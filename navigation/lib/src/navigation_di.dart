import 'package:core/config/di/app_di.dart';
import 'package:data/repositories/menu_repository_impl/menu_repository_impl.dart';
import 'package:domain/usecases/fetch_menu_items_usecase.dart';

void setupNavigationDependencies() {
  instance.registerLazySingleton<FetchMenuItemsUseCase>(
    () => FetchMenuItemsUseCase(
      menuRepository: MenuRepositoryImpl(),
    ),
  );
}
