import 'package:cv_desing_website_flutter/domain/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AcademyTrainings trainings;
  setUp(() {
    trainings = AcademyTrainings.empty();
  });
  group('AcademyTrainins should', () {
    test('store a training', () {
      final training = AcademyTraining.empty();

      final result = trainings.add(training);

      expect(result.value, contains(training));
    });

    test('delete an training', () {
      final training = AcademyTraining.empty();
      final anyNotEmptyTrainings = trainings.add(training);

      final result = anyNotEmptyTrainings.remove(training);

      expect(result.value, isEmpty);
    });
    test('update a training', () {
      final training = AcademyTraining.empty();
      final editedTraining = training.copyWith(title: Title('otherTitle'));
      trainings.add(training);

      final result = trainings.add(editedTraining);

      final expectedTrainings = AcademyTrainings([editedTraining]);
      expect(result, equals(expectedTrainings));
    });
  });
}
