import 'package:cv_desing_website_flutter/domain/value_failures.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'date_mother.dart';

void main() {
  group('DateRange should', () {
    test('return a valid date range', () {
      final since = DateMother.random();
      final until = since.add(const Duration(days: 20));

      final dateRange = DateRange(since: since, until: until);

      final expectedRange = RangeOfDates(since, until);
      expect(dateRange.value, right(expectedRange));
    });

    for (final testCase in [
      {'since': null, 'until': null},
      {'since': null, 'until': DateMother.random()},
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
    test(
        'return an invalid start date when the date is greater than today by one month',
        () {
      final since = DateTime.now().add(const Duration(days: 31));

      final dateRange = DateRange(since: since, until: null);

      final expectedFailure = ExceedingMaxStartDate(RangeOfDates(since, null));
      expect(dateRange.value, left(expectedFailure));
    });
    test(
        'return an invalid end date when the end date is less than the start date',
        () {
      final since = DateMother.random();
      final until = since.subtract(const Duration(days: 1));

      final dateRange = DateRange(since: since, until: until);

      final expectedFailure = InvalidEndDate(RangeOfDates(since, until));
      expect(dateRange.value, left(expectedFailure));
    });
  });
}
