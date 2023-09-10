import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';

const Key widgetKey = Key('orderItem');

final OrderItemModel orderItem = OrderItemModel(
  id: 1,
  isCompleted: false,
  shoppingCart: ShoppingCartModel(
    shoppingCartItems: <ShoppingCartItemModel>[
      ShoppingCartItemModel(
        menuItem: MenuItemModel(
            id: '1',
            title: 'scallop',
            cost: 9.5,
            image: '',
            category: 'Fish',
            description: 'Lorem ipsum',
            ingredients: ['scallop', 'sauce']),
        amount: 1,
      )
    ],
    totalPrice: 10,
    addCutlery: true,
  ),
  date: '2023-08-27 15:54:31.952313',
);
