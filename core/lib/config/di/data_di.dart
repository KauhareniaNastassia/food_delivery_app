import 'package:data/data.dart';
import 'package:domain/domain.dart';
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
    _initShoppingCart();
    _initHive();
    _initAdapters();
  }

  void _initFirebaseOptions() {
    instance.registerLazySingleton<FirebaseOptions>(
      () => DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: instance<FirebaseOptions>(),
    );
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(
      instance.get<MenuItemEntityAdapter>(),
    );
    Hive.registerAdapter(
      instance.get<ShoppingCartItemEntityAdapter>(),
    );
  }

  void _initAdapters() {
    instance.registerLazySingleton<MenuItemEntityAdapter>(
      () => MenuItemEntityAdapter(),
    );
    instance.registerLazySingleton<ShoppingCartItemEntityAdapter>(
      () => ShoppingCartItemEntityAdapter(),
    );
  }

  void _initDataProvider() {
    instance.registerLazySingleton<MenuDataProvider>(
      () => MenuDataProvider(
        FirebaseFirestore.instance,
      ),
    );

    instance.registerLazySingleton<LocalMenuProvider>(
      () => LocalMenuProvider(),
    );

    instance.registerLazySingleton<LocalShoppingCartProvider>(
      () => LocalShoppingCartProvider(),
    );
  }

  void _initMenuItems() {
    instance.registerLazySingleton<MenuRepository>(
      () => MenuRepositoryImpl(
        menuDataProvider: instance.get<MenuDataProvider>(),
        localMenuProvider: instance.get<LocalMenuProvider>(),
      ),
    );

    instance.registerLazySingleton<FetchMenuItemsUseCase>(
      () => FetchMenuItemsUseCase(
        menuRepository: instance.get<MenuRepository>(),
      ),
    );
  }

  void _initShoppingCart() {
    instance.registerLazySingleton<ShoppingCartRepository>(
      () => ShoppingCartRepositoryImpl(
        localShoppingCartProvider: instance.get<LocalShoppingCartProvider>(),
      ),
    );

    instance.registerLazySingleton<GetShoppingCartUseCase>(
      () => GetShoppingCartUseCase(
        shoppingCartRepository: instance.get<ShoppingCartRepository>(),
      ),
    );

    instance.registerLazySingleton<AddShoppingCartItemUseCase>(
      () => AddShoppingCartItemUseCase(
        shoppingCartRepository: instance.get<ShoppingCartRepository>(),
      ),
    );

    instance.registerLazySingleton<RemoveShoppingCartItemUseCase>(
      () => RemoveShoppingCartItemUseCase(
        shoppingCartRepository: instance.get<ShoppingCartRepository>(),
      ),
    );
  }
}
