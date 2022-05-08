import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/academy_training_form/academy_training_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/value_failures.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/schoold.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:dartz/dartz.dart';
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
            saveFailureOrSuccessOption: none(),
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
          saveFailureOrSuccessOption: none(),
          academyTraining: AcademyTraining(
            title: Title('anyTitle'),
            schoold: Schoold.empty(),
            dateRange: DateRange.empty(),
          ),
        ),
        AcademyTrainingFormState(
          saveFailureOrSuccessOption: none(),
          academyTraining: AcademyTraining(
            title: Title('otherTitle'),
            schoold: Schoold.empty(),
            dateRange: DateRange.empty(),
          ),
        ),
      ],
    );
    blocTest<AcademyTrainingFormBloc, AcademyTrainingFormState>(
      'save academy training',
      build: () => AcademyTrainingFormBloc(),
      seed: () => AcademyTrainingFormState(
        saveFailureOrSuccessOption: none(),
        academyTraining: AcademyTraining(
          title: Title('anyTitle'),
          schoold: Schoold('anySchoold'),
          dateRange: DateRange(since: DateTime(2022), until: null),
        ),
      ),
      act: (bloc) => bloc..add(Saved()),
      expect: () => <AcademyTrainingFormState>[
        AcademyTrainingFormState(
          saveFailureOrSuccessOption: some(right(unit)),
          academyTraining: AcademyTraining(
            title: Title('anyTitle'),
            schoold: Schoold('anySchoold'),
            dateRange: DateRange(since: DateTime(2022), until: null),
          ),
        ),
      ],
    );
    blocTest<AcademyTrainingFormBloc, AcademyTrainingFormState>(
      'not allow save academy training is wrong',
      build: () => AcademyTrainingFormBloc(),
      seed: () => AcademyTrainingFormState(
        saveFailureOrSuccessOption: none(),
        academyTraining: AcademyTraining.empty(),
      ),
      act: (bloc) => bloc..add(Saved()),
      expect: () => <AcademyTrainingFormState>[
        AcademyTrainingFormState(
          saveFailureOrSuccessOption: some(left(const Empty<String>())),
          academyTraining: AcademyTraining.empty(),
        ),
      ],
    );
    blocTest<AcademyTrainingFormBloc, AcademyTrainingFormState>(
      'update schoold',
      build: () => AcademyTrainingFormBloc(),
      act: (bloc) => bloc
        ..add(const SchooldChanged('anySchoold'))
        ..add(const SchooldChanged('otherSchoold')),
      expect: () => <AcademyTrainingFormState>[
        AcademyTrainingFormState(
          saveFailureOrSuccessOption: none(),
          academyTraining: AcademyTraining(
            title: Title.empty(),
            schoold: Schoold('anySchoold'),
            dateRange: DateRange.empty(),
          ),
        ),
        AcademyTrainingFormState(
          saveFailureOrSuccessOption: none(),
          academyTraining: AcademyTraining(
            title: Title.empty(),
            schoold: Schoold('otherSchoold'),
            dateRange: DateRange.empty(),
          ),
        ),
      ],
    );
    blocTest<AcademyTrainingFormBloc, AcademyTrainingFormState>(
      'update date range',
      build: () => AcademyTrainingFormBloc(),
      act: (bloc) => bloc
        ..add(DateRangeChanged(since: DateTime(2020, 2, 3)))
        ..add(
          DateRangeChanged(
            since: DateTime(2020, 2, 3),
            until: DateTime(2020, 3, 5),
          ),
        )
        ..add(DateRangeChanged(since: DateTime(2020, 2, 3)))
        ..add(DateRangeChanged(since: DateTime(2021, 5, 11))),
      expect: () => <AcademyTrainingFormState>[
        AcademyTrainingFormState(
          saveFailureOrSuccessOption: none(),
          academyTraining: AcademyTraining(
            title: Title.empty(),
            schoold: Schoold.empty(),
            dateRange: DateRange(since: DateTime(2020, 2, 3), until: null),
          ),
        ),
        AcademyTrainingFormState(
          saveFailureOrSuccessOption: none(),
          academyTraining: AcademyTraining(
            title: Title.empty(),
            schoold: Schoold.empty(),
            dateRange: DateRange(
              since: DateTime(2020, 2, 3),
              until: DateTime(2020, 3, 5),
            ),
          ),
        ),
        AcademyTrainingFormState(
          saveFailureOrSuccessOption: none(),
          academyTraining: AcademyTraining(
            title: Title.empty(),
            schoold: Schoold.empty(),
            dateRange: DateRange(since: DateTime(2020, 2, 3), until: null),
          ),
        ),
        AcademyTrainingFormState(
          saveFailureOrSuccessOption: none(),
          academyTraining: AcademyTraining(
            title: Title.empty(),
            schoold: Schoold.empty(),
            dateRange: DateRange(since: DateTime(2021, 5, 11), until: null),
          ),
        ),
      ],
    );
  });
}
