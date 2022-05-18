import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/complementary_training_form/complementary_training_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/complementary_training.dart';
import 'package:cv_desing_website_flutter/domain/value_failures.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/course_hours.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/schoold.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final initialState = ComplementaryTrainingFormState(
    showErrorMessages: false,
    isLoaded: false,
    saveFailureOrSuccessOption: none(),
    complementaryTraining: ComplementaryTraining(
      uniqueId: UniqueId(),
      title: Title(''),
      schoold: Schoold(''),
      dateRange: DateRange(since: null, until: null),
      courseHoursOption: none(),
    ),
  );

  group('ComplementaryTrainingFormBloc should', () {
    test('has empty as initial state', () {
      final bloc = ComplementaryTrainingFormBloc();
      // assert
      expect(
        bloc.state,
        equals(initialState),
      );
    });

    blocTest<ComplementaryTrainingFormBloc, ComplementaryTrainingFormState>(
      'update title',
      build: () => ComplementaryTrainingFormBloc(),
      seed: () => initialState,
      act: (bloc) => bloc
        ..add(const TitleChanged('anyTitle'))
        ..add(const TitleChanged('otherTitle')),
      expect: () => <ComplementaryTrainingFormState>[
        initialState.copyWith(
          complementaryTraining: initialState.complementaryTraining
              .copyWith(title: Title('anyTitle')),
        ),
        initialState.copyWith(
          complementaryTraining: initialState.complementaryTraining
              .copyWith(title: Title('otherTitle')),
        ),
      ],
    );
    blocTest<ComplementaryTrainingFormBloc, ComplementaryTrainingFormState>(
      'not update work complemented training',
      build: () => ComplementaryTrainingFormBloc(),
      seed: () => initialState,
      act: (bloc) => bloc
        ..add(
          Initialized(
            none(),
          ),
        ),
      expect: () => <ComplementaryTrainingFormState>[],
    );
    blocTest<ComplementaryTrainingFormBloc, ComplementaryTrainingFormState>(
      'initialized with complementaryTraining',
      build: () => ComplementaryTrainingFormBloc(),
      seed: () => initialState,
      wait: const Duration(seconds: 1),
      act: (bloc) => bloc
        ..add(
          Initialized(
            some(
              ComplementaryTraining(
                uniqueId: UniqueId.fromString('anyId'),
                title: Title('anyTitle'),
                schoold: Schoold('anySchoold'),
                dateRange: DateRange(since: DateTime(2022), until: null),
                courseHoursOption: none(),
              ),
            ),
          ),
        ),
      expect: () => <ComplementaryTrainingFormState>[
        ComplementaryTrainingFormState(
          showErrorMessages: false,
          isLoaded: true,
          saveFailureOrSuccessOption: none(),
          complementaryTraining: ComplementaryTraining(
            courseHoursOption: none(),
            uniqueId: UniqueId.fromString('anyId'),
            title: Title('anyTitle'),
            schoold: Schoold('anySchoold'),
            dateRange: DateRange(since: DateTime(2022), until: null),
          ),
        ),
        ComplementaryTrainingFormState(
          showErrorMessages: false,
          isLoaded: false,
          saveFailureOrSuccessOption: none(),
          complementaryTraining: ComplementaryTraining(
            courseHoursOption: none(),
            uniqueId: UniqueId.fromString('anyId'),
            title: Title('anyTitle'),
            schoold: Schoold('anySchoold'),
            dateRange: DateRange(since: DateTime(2022), until: null),
          ),
        ),
      ],
    );
    blocTest<ComplementaryTrainingFormBloc, ComplementaryTrainingFormState>(
      'save complementary training',
      build: () => ComplementaryTrainingFormBloc(),
      seed: () => ComplementaryTrainingFormState(
        isLoaded: false,
        showErrorMessages: false,
        saveFailureOrSuccessOption: none(),
        complementaryTraining: ComplementaryTraining(
          courseHoursOption: none(),
          uniqueId: UniqueId.fromString('anyId'),
          title: Title('anyTitle'),
          schoold: Schoold('anySchoold'),
          dateRange: DateRange(since: DateTime(2022), until: null),
        ),
      ),
      act: (bloc) => bloc..add(Saved()),
      expect: () => <ComplementaryTrainingFormState>[
        ComplementaryTrainingFormState(
          isLoaded: false,
          showErrorMessages: true,
          saveFailureOrSuccessOption: some(right(unit)),
          complementaryTraining: ComplementaryTraining(
            courseHoursOption: none(),
            uniqueId: UniqueId.fromString('anyId'),
            title: Title('anyTitle'),
            schoold: Schoold('anySchoold'),
            dateRange: DateRange(since: DateTime(2022), until: null),
          ),
        ),
      ],
    );
    blocTest<ComplementaryTrainingFormBloc, ComplementaryTrainingFormState>(
      'not allow save complementary training is wrong',
      build: () => ComplementaryTrainingFormBloc(),
      seed: () => initialState,
      act: (bloc) => bloc..add(Saved()),
      expect: () => <ComplementaryTrainingFormState>[
        initialState.copyWith(
          showErrorMessages: true,
          saveFailureOrSuccessOption: some(left(const Empty<String>())),
        ),
      ],
    );
    blocTest<ComplementaryTrainingFormBloc, ComplementaryTrainingFormState>(
      'update course hours',
      build: () => ComplementaryTrainingFormBloc(),
      seed: () => initialState,
      act: (bloc) => bloc
        ..add(const CourseHoursChanged(1))
        ..add(const CourseHoursChanged(null))
        ..add(const CourseHoursChanged(2)),
      expect: () => <ComplementaryTrainingFormState>[
        initialState.copyWith(
          complementaryTraining: initialState.complementaryTraining
              .copyWith(courseHoursOption: some(CourseHours(1))),
        ),
        initialState.copyWith(
          complementaryTraining: initialState.complementaryTraining
              .copyWith(courseHoursOption: none()),
        ),
        initialState.copyWith(
          complementaryTraining: initialState.complementaryTraining
              .copyWith(courseHoursOption: some(CourseHours(2))),
        ),
      ],
    );
    blocTest<ComplementaryTrainingFormBloc, ComplementaryTrainingFormState>(
      'update schoold',
      build: () => ComplementaryTrainingFormBloc(),
      seed: () => initialState,
      act: (bloc) => bloc
        ..add(const SchooldChanged('anySchoold'))
        ..add(const SchooldChanged('otherSchoold')),
      expect: () => <ComplementaryTrainingFormState>[
        initialState.copyWith(
          complementaryTraining: initialState.complementaryTraining
              .copyWith(schoold: Schoold('anySchoold')),
        ),
        initialState.copyWith(
          complementaryTraining: initialState.complementaryTraining
              .copyWith(schoold: Schoold('otherSchoold')),
        ),
      ],
    );
    blocTest<ComplementaryTrainingFormBloc, ComplementaryTrainingFormState>(
      'update date range',
      build: () => ComplementaryTrainingFormBloc(),
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
      expect: () => <ComplementaryTrainingFormState>[
        initialState.copyWith(
          complementaryTraining: initialState.complementaryTraining.copyWith(
              dateRange: DateRange(since: DateTime(2020, 2, 3), until: null)),
        ),
        initialState.copyWith(
          complementaryTraining: initialState.complementaryTraining.copyWith(
            dateRange: DateRange(
              since: DateTime(2020, 2, 3),
              until: DateTime(2020, 3, 5),
            ),
          ),
        ),
        initialState.copyWith(
          complementaryTraining: initialState.complementaryTraining.copyWith(
            dateRange: DateRange(since: DateTime(2020, 2, 3), until: null),
          ),
        ),
        initialState.copyWith(
          complementaryTraining: initialState.complementaryTraining.copyWith(
            dateRange: DateRange(since: DateTime(2021, 5, 11), until: null),
          ),
        ),
      ],
    );
  });
}
