import 'package:faker/faker.dart';

class DateMother {
  static DateTime random() {
    final currentYear = DateTime.now().year;
    return DateTime(
      faker.date.dateTime(minYear: currentYear - 99, maxYear: currentYear).year,
    );
  }
}
