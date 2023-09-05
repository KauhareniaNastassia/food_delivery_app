import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:order_history/order_history.dart';

import 'mock_for_widget_test.dart';

void main() {
  testWidgets(
    'OrderItem widget test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderItem(
              orderItem: orderItem,
              key: widgetKey,
            ),
          ),
        ),
      );

      expect(find.byKey(widgetKey), findsOneWidget);
    },
  );
}
