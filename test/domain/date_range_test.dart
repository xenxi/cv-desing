import 'package:cv_desing_website_flutter/domain/value_failures.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateRange should', () {
    test('return a valid date range', () {
      final since = DateTime(2020);
      final until = DateTime(2020, 1, 2);

      final dateRange = DateRange(since: since, until: until);

      final expectedRange = RangeOfDates(since, until);
      expect(dateRange.value, right(expectedRange));
    });

    for (final testCase in [
      {'since': null, 'until': null},
      {'since': null, 'until': DateTime(2020)},
    ]) {
      test('return an invalid empty date range', () {
        final since = testCase['since'];
        final until = testCase['until'];

        final dateRange = DateRange(since: since, until: until);

        const expectedFailure = Empty<RangeOfDates>();
        expect(dateRange.value, left(expectedFailure));
      });
    }

    test(
        'return an invalid start date when start date is one hundred years ago',
        () {
      final since = DateTime(DateTime.now().year - 101);

      final dateRange = DateRange(since: since, until: null);

      final expectedFailure = ExceedingMinStartDate(RangeOfDates(since, null));
      expect(dateRange.value, left(expectedFailure));
    });
  });
}
