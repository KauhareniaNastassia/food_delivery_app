import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settings/settings.dart';

void main() {
  group('SwitchToTheme', () {
      testWidgets(
        'SwitchToTheme widget test',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: SwitchToTheme(
                  isLight: true,
                  title: 'Change theme',
                  onTap: () {},
                ),
              ),
            ),
          );

          expect(find.text('Change theme'), findsOneWidget);
        },
      );

      testWidgets(
        'SwitchToTheme widget test',
        (WidgetTester tester) async {
          bool isTapped = false;

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: SwitchToTheme(
                  isLight: true,
                  title: 'Change theme',
                  onTap: () {
                    isTapped = true;
                  },
                ),
              ),
            ),
          );

          await tester.tap(
            find.byIcon(Icons.brightness_4_rounded),
          );
          await tester.pump();
          expect(isTapped, true);
        },
      );
    },
  );
}
