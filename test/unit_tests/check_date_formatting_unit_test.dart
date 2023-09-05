import 'package:core/date_formatter/date_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check date formatting', () {
    const String date = '2023-08-27 15:54:31.952313';
    final result = DateFormatter().formatDateString(date);
    expect(result, equals('2023/08/27 15:54:31'));
  });
}
