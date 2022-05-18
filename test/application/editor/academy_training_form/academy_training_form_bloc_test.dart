import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/academy_training_form/academy_training_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/value_failures.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/schoold.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final initialState = AcademyTrainingFormState(
    showErrorMessages: false,
    isLoaded: false,
    saveFailureOrSuccessOption: none(),
    academyTraining: AcademyTraining(
      uniqueId: UniqueId(),
      title: Title(''),
      schoold: Schoold(''),
      dateRange: DateRange(since: null, until: null),
    ),
  );

  group('AcademyTrainingFormBloc should', () {
    test('has empty as initial state', () {
      final bloc = AcademyTrainingFormBloc();
      // assert
      expect(
        bloc.state,
        equals(initialState),
      );
    });

    blocTest<AcademyTrainingFormBloc, AcademyTrainingFormState>(
      'update title',
      build: () => AcademyTrainingFormBloc(),
      seed: () => initialState,
      act: (bloc) => bloc
        ..add(const TitleChanged('anyTitle'))
        ..add(const TitleChanged('otherTitle')),
      expect: () => <AcademyTrainingFormState>[
        initialState.copyWith(
          academyTraining:
              initialState.academyTraining.copyWith(title: Title('anyTitle')),
        ),
        initialState.copyWith(
          academyTraining:
              initialState.academyTraining.copyWith(title: Title('otherTitle')),
        ),
      ],
    );
    blocTest<AcademyTrainingFormBloc, AcademyTrainingFormState>(
      'not update work academy training',
      build: () => AcademyTrainingFormBloc(),
      seed: () => initialState,
      act: (bloc) => bloc
        ..add(
          Initialized(
            none(),
          ),
        ),
      expect: () => <AcademyTrainingFormState>[],
    );
    blocTest<AcademyTrainingFormBloc, AcademyTrainingFormState>(
      'initialized with academy training',
      build: () => AcademyTrainingFormBloc(),
      seed: () => initialState,
      wait: const Duration(seconds: 1),
      act: (bloc) => bloc
        ..add(
          Initialized(
            some(
              AcademyTraining(
                uniqueId: UniqueId.fromString('anyId'),
                title: Title('anyTitle'),
                schoold: Schoold('anySchoold'),
                dateRange: DateRange(since: DateTime(2022), until: null),
              ),
            ),
          ),
        ),
      expect: () => <AcademyTrainingFormState>[
        AcademyTrainingFormState(
          showErrorMessages: false,
          isLoaded: true,
          saveFailureOrSuccessOption: none(),
          academyTraining: AcademyTraining(
            uniqueId: UniqueId.fromString('anyId'),
            title: Title('anyTitle'),
            schoold: Schoold('anySchoold'),
            dateRange: DateRange(since: DateTime(2022), until: null),
          ),
        ),
        AcademyTrainingFormState(
          showErrorMessages: false,
          isLoaded: false,
          saveFailureOrSuccessOption: none(),
          academyTraining: AcademyTraining(
            uniqueId: UniqueId.fromString('anyId'),
            title: Title('anyTitle'),
            schoold: Schoold('anySchoold'),
            dateRange: DateRange(since: DateTime(2022), until: null),
          ),
        ),
      ],
    );
    blocTest<AcademyTrainingFormBloc, AcademyTrainingFormState>(
      'save academy training',
      build: () => AcademyTrainingFormBloc(),
      seed: () => AcademyTrainingFormState(
        isLoaded: false,
        showErrorMessages: false,
        saveFailureOrSuccessOption: none(),
        academyTraining: AcademyTraining(
          uniqueId: UniqueId.fromString('anyId'),
          title: Title('anyTitle'),
          schoold: Schoold('anySchoold'),
          dateRange: DateRange(since: DateTime(2022), until: null),
        ),
      ),
      act: (bloc) => bloc..add(Saved()),
      expect: () => <AcademyTrainingFormState>[
        AcademyTrainingFormState(
          isLoaded: false,
          showErrorMessages: true,
          saveFailureOrSuccessOption: some(right(unit)),
          academyTraining: AcademyTraining(
            uniqueId: UniqueId.fromString('anyId'),
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
      seed: () => initialState,
      act: (bloc) => bloc..add(Saved()),
      expect: () => <AcademyTrainingFormState>[
        initialState.copyWith(
          showErrorMessages: true,
          saveFailureOrSuccessOption: some(left(const Empty<String>())),
        ),
      ],
    );
    blocTest<AcademyTrainingFormBloc, AcademyTrainingFormState>(
      'update schoold',
      build: () => AcademyTrainingFormBloc(),
      seed: () => initialState,
      act: (bloc) => bloc
        ..add(const SchooldChanged('anySchoold'))
        ..add(const SchooldChanged('otherSchoold')),
      expect: () => <AcademyTrainingFormState>[
        initialState.copyWith(
          academyTraining: initialState.academyTraining
              .copyWith(schoold: Schoold('anySchoold')),
        ),
        initialState.copyWith(
          academyTraining: initialState.academyTraining
              .copyWith(schoold: Schoold('otherSchoold')),
        ),
      ],
    );
    blocTest<AcademyTrainingFormBloc, AcademyTrainingFormState>(
      'update date range',
      build: () => AcademyTrainingFormBloc(),
      seed: () => initialState,
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
        initialState.copyWith(
          academyTraining: initialState.academyTraining.copyWith(
              dateRange: DateRange(since: DateTime(2020, 2, 3), until: null)),
        ),
        initialState.copyWith(
          academyTraining: initialState.academyTraining.copyWith(
            dateRange: DateRange(
              since: DateTime(2020, 2, 3),
              until: DateTime(2020, 3, 5),
            ),
          ),
        ),
        initialState.copyWith(
          academyTraining: initialState.academyTraining.copyWith(
            dateRange: DateRange(since: DateTime(2020, 2, 3), until: null),
          ),
        ),
        initialState.copyWith(
          academyTraining: initialState.academyTraining.copyWith(
            dateRange: DateRange(since: DateTime(2021, 5, 11), until: null),
          ),
        ),
      ],
    );
  });
}
