import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/academy_training_form/academy_training_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AcademyTrainingFormBloc should', () {
    test('has empty as initial state', () {
      final bloc = AcademyTrainingFormBloc();
      // assert
      expect(
        bloc.state,
        equals(
          AcademyTrainingFormState(
            academyTraining: AcademyTraining.empty(),
          ),
        ),
      );
    });

    blocTest<AcademyTrainingFormBloc, AcademyTrainingFormState>(
      'update title',
      build: () => AcademyTrainingFormBloc(),
      act: (bloc) => bloc
        ..add(const TitleChanged('anyTitle'))
        ..add(const TitleChanged('otherTitle')),
      expect: () => <AcademyTrainingFormState>[
        AcademyTrainingFormState(
          academyTraining: AcademyTraining(
            title: Title('anyTitle'),
            schoold: '',
            dateRange: DateRange.empty(),
          ),
        ),
        AcademyTrainingFormState(
          academyTraining: AcademyTraining(
            title: Title('otherTitle'),
            schoold: '',
            dateRange: DateRange.empty(),
          ),
        ),
      ],
    );
  });
}
