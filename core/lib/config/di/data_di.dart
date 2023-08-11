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
    _initGoogleSignIn();
    _initHive();
    _initProviders();
    _initAdapters();
    _initMenuItems();
    _initShoppingCart();
    _initSettings();
    _initAuth();
    _initOrderHistory();
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

  Future<void> _initGoogleSignIn() async {
    instance.registerLazySingleton<GoogleSignIn>(
      () => GoogleSignIn(),
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
    Hive.registerAdapter(
      instance.get<UserInfoEntityAdapter>(),
    );
  }

  void _initAdapters() {
    instance.registerLazySingleton<MenuItemEntityAdapter>(
      () => MenuItemEntityAdapter(),
    );
    instance.registerLazySingleton<ShoppingCartItemEntityAdapter>(
      () => ShoppingCartItemEntityAdapter(),
    );
    instance.registerLazySingleton<UserInfoEntityAdapter>(
      () => UserInfoEntityAdapter(),
    );
  }

  Future<void> _initProviders() async {
    instance.registerLazySingleton<HiveProvider>(
      () => HiveProvider(),
    );
    instance.registerLazySingleton<FirebaseFireStoreProvider>(
      () => FirebaseFireStoreProvider(
        fireStore: FirebaseFirestore.instance,
      ),
    );
    instance.registerLazySingleton<FirebaseAuthProvider>(
      () => FirebaseAuthProvider(
        firebaseAuth: FirebaseAuth.instance,
        googleSignIn: instance.get<GoogleSignIn>(),
      ),
    );
  }

  void _initMenuItems() {
    instance.registerLazySingleton<MenuRepository>(
      () => MenuRepositoryImpl(
        firebaseFireStoreProvider: instance.get<FirebaseFireStoreProvider>(),
        hiveProvider: instance.get<HiveProvider>(),
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
        hiveProvider: instance.get<HiveProvider>(),
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

    instance.registerLazySingleton<ClearShoppingCartUseCase>(
      () => ClearShoppingCartUseCase(
        shoppingCartRepository: instance.get<ShoppingCartRepository>(),
      ),
    );
  }

  void _initSettings() {
    instance.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        hiveProvider: instance.get<HiveProvider>(),
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

    instance.registerLazySingleton<GetLanguageUseCase>(
          () => GetLanguageUseCase(
        settingsRepository: instance.get<SettingsRepository>(),
      ),
    );

    instance.registerLazySingleton<SetLanguageUseCase>(
          () => SetLanguageUseCase(
        settingsRepository: instance.get<SettingsRepository>(),
      ),
    );
  }

  void _initAuth() {
    instance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        firebaseAuthProvider: instance.get<FirebaseAuthProvider>(),
        firebaseFireStoreProvider: instance.get<FirebaseFireStoreProvider>(),
        hiveProvider: instance.get<HiveProvider>(),
      ),
    );

    instance.registerLazySingleton<CheckIsUserLoggedUseCase>(
      () => CheckIsUserLoggedUseCase(
        authRepository: instance.get<AuthRepository>(),
      ),
    );

    instance.registerLazySingleton<GetUserIdUseCase>(
      () => GetUserIdUseCase(
        authRepository: instance.get<AuthRepository>(),
      ),
    );

    instance.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(
        authRepository: instance.get<AuthRepository>(),
      ),
    );

    instance.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(
        authRepository: instance.get<AuthRepository>(),
      ),
    );

    instance.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(
        authRepository: instance.get<AuthRepository>(),
      ),
    );

    instance.registerLazySingleton<SignInViaGoogleUseCase>(
      () => SignInViaGoogleUseCase(
        authRepository: instance.get<AuthRepository>(),
      ),
    );
  }

  void _initOrderHistory() {
    instance.registerLazySingleton<OrderHistoryRepository>(
      () => OrderHistoryRepositoryImpl(
        firebaseFireStoreProvider: instance.get<FirebaseFireStoreProvider>(),
      ),
    );

    instance.registerLazySingleton<FetchOrderHistoryUseCase>(
      () => FetchOrderHistoryUseCase(
        orderHistoryRepository: instance.get<OrderHistoryRepository>(),
      ),
    );

    instance.registerLazySingleton<CreateOrderUseCase>(
      () => CreateOrderUseCase(
        orderHistoryRepository: instance.get<OrderHistoryRepository>(),
      ),
    );
  }
}
