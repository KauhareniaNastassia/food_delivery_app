import 'package:core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'food_app/food_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  appDI.initDependencies();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('es'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const FoodApp(),
    ),
  );
}
