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
    _initHive();
    _initAdapters();
    _initMenuItems();
    _initShoppingCart();
    _initSettings();
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

    instance.registerLazySingleton<SettingsLocalProvider>(
      () => SettingsLocalProvider(),
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

  _initSettings() {
    instance.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        settingsLocalProvider: instance.get<SettingsLocalProvider>(),
      ),
    );

    instance.registerLazySingleton<GetThemeUseCase>(
      () => GetThemeUseCase(
        settingsRepository: instance.get<SettingsRepository>(),
      ),
    );

    instance.registerLazySingleton<SetThemeUseCase>(
      () => SetThemeUseCase(
        settingsRepository: instance.get<SettingsRepository>(),
      ),
    );

    instance.registerLazySingleton<GetColorSchemeUseCase>(
          () => GetColorSchemeUseCase(
        settingsRepository: instance.get<SettingsRepository>(),
      ),
    );

    instance.registerLazySingleton<SetColorSchemeUseCase>(
          () => SetColorSchemeUseCase(
        settingsRepository: instance.get<SettingsRepository>(),
      ),
    );

    instance.registerLazySingleton<GetFontSizeUseCase>(
          () => GetFontSizeUseCase(
        settingsRepository: instance.get<SettingsRepository>(),
      ),
    );

    instance.registerLazySingleton<SetFontSizeUseCase>(
          () => SetFontSizeUseCase(
        settingsRepository: instance.get<SettingsRepository>(),
      ),
    );
  }
}
