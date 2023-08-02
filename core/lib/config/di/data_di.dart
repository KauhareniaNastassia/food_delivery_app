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
    _initDataProvider();
    _initHive();
    _initAdapters();
    _initMenuItems();
    _initShoppingCart();
    _initSettings();
    _initAuth();
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

  Future<void> _initDataProvider() async {
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

    instance.registerLazySingleton<AuthProvider>(
      () => AuthProvider(
        firebaseAuth: FirebaseAuth.instance,
        fireStore: FirebaseFirestore.instance,
        googleSignIn: instance.get<GoogleSignIn>(),
      ),
    );

    instance.registerLazySingleton<LocalAuthProvider>(
      () => LocalAuthProvider(),
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

  _initAuth() {
    instance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        authProvider: instance.get<AuthProvider>(),
        localAuthProvider: instance.get<LocalAuthProvider>(),
      ),
    );

    instance.registerLazySingleton<CheckIsUserLoggedUseCase>(
      () => CheckIsUserLoggedUseCase(
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
}
