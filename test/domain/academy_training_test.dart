import 'package:cv_desing_website_flutter/domain/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AcademyTrainins should', () {
    test('store a training', () {
      final trainings = AcademyTrainings.empty();
      final training = AcademyTraining.empty();

      final result = trainings.add(training);

      expect(result.value, contains(training));
    });
    test('delete a training', () {
      final training = AcademyTraining.empty();
      final trainings = AcademyTrainings.empty()..add(training);

      final result = trainings.remove(training);

      expect(result.value, isNot(contains(training)));
    });
    test('update a training', () {
      final training = AcademyTraining.empty();
      final trainings = AcademyTrainings.empty().add(training);
      final editedTraining = training.copyWith(title: Title('otherTitle'));

      final result = trainings.add(editedTraining);

      expect(result.value, isNot(contains(training)));
      expect(result.value, contains(editedTraining));
    });
  });
}
