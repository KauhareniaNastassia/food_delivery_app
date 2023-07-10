import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/providers/menu_provider.dart';
import 'package:data/repositories/menu_repository_impl/menu_repository_impl.dart';
import 'package:domain/repositories/menu_repository.dart';
import 'package:domain/usecases/fetch_menu_items_usecase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'firebase_options.dart';

final DataDI dataDI = DataDI();
final GetIt instance = GetIt.instance;

class DataDI {
  Future<void> initDependencies() async {
    _initFirebaseOptions();
    _initFirebase();
    _initDataProvider();
    _initMenuItems();
  }

  void _initFirebaseOptions() {
    instance.registerLazySingleton<FirebaseOptions>(
      () => DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _initFirebase() async {
    await Firebase.initializeApp(
      options: instance<FirebaseOptions>(),
    );
  }

  void _initDataProvider() {
    instance.registerLazySingleton<MenuDataProvider>(
      () => MenuDataProvider(
        FirebaseFirestore.instance,
      ),
    );
  }

  void _initMenuItems() {
    instance.registerLazySingleton<MenuRepository>(
      () => MenuRepositoryImpl(
        menuDataProvider: instance.get<MenuDataProvider>(),
      ),
    );

    instance.registerLazySingleton<FetchMenuItemsUseCase>(
      () => FetchMenuItemsUseCase(
        menuRepository: instance.get<MenuRepository>(),
      ),
    );
  }
}
