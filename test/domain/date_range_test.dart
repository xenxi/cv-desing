import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateRange should', () {
    test('return a valid date range', () {
      final since = DateTime(2020);
      final until = DateTime(2020, 1, 2);

      final dateRange = DateRange(since: since, until: until);

      final expectedRange = RangeOfDates(since, optionOf(until));
      expect(dateRange.value, right(expectedRange));
    });
  });
}
