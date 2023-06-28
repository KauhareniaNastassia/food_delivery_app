import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => const MainPage(),
      ),
    );
  }
}
