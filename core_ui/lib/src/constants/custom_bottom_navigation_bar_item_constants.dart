import 'package:flutter/material.dart';

class CustomBottomNavigationBarItems {
  static List<IconData> listOfIcons = <IconData>[
    Icons.home_outlined,
    Icons.shopping_cart_outlined,
    Icons.history_outlined,
    Icons.settings,
  ];

  static List<IconData> listOfAdminPanelIcons = <IconData>[
    Icons.home_outlined,
    Icons.history_outlined,
    Icons.people_alt_outlined,
    Icons.settings,
  ];

  static List<String> listOfLabels = <String>[
    'home',
    'cart',
    'orders',
    'settings',
  ];

  static List<String> listOfAdminPanelLabels = <String>[
    'home',
    'orders',
    'users',
    'settings',
  ];
}
