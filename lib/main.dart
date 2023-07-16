import 'package:core/config/di/app_di.dart';
import 'package:core/config/di/firebase_options.dart';
import 'package:core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'food_app/food_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  await Hive.openBox('shoppingCart');

  appDI.initDependencies();

  runApp(
    const FoodApp(),
  );
}
