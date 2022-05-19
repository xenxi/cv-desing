import 'package:cv_desing_website_flutter/domain/resumes/entities/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final training = AcademyTraining.empty();

  group('AcademyTrainins should', () {
    test('store a training', () {
      final trainings = AcademyTrainings.empty();

      final result = trainings.add(training);

      expect(result.value, contains(training));
    });

    test('delete an training', () {
      final trainings = AcademyTrainings([training]);

      final result = trainings.remove(training);

      expect(result.value, isEmpty);
    });
    test('update a training', () {
      final trainings = AcademyTrainings([training]);
      final editedTraining = training.copyWith(title: Title('otherTitle'));

      final result = trainings.add(editedTraining);

      final expectedTrainings = AcademyTrainings([editedTraining]);
      expect(result, equals(expectedTrainings));
    });
  });
}
