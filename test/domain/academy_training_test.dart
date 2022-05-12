import 'package:cv_desing_website_flutter/domain/academy_training.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AcademyTrainins should', () {
    test('store a training', () {
      final trainings = AcademyTrainings.empty();
      final training = AcademyTraining.empty();

      final result = trainings.add(training);

      expect(result.value, contains(training));
    });
  });
}
