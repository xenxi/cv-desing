import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/work_experience_form/work_experience_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/work_experience.dart';
import 'package:cv_desing_website_flutter/domain/value_failures.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart'
    as domain;
import 'package:cv_desing_website_flutter/domain/value_objects/employer.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final initialState = WorkExperienceFormState(
    showErrorMessages: false,
    isLoaded: false,
    saveFailureOrSuccessOption: none(),
    workExperience: WorkExperience(
      uniqueId: UniqueId(),
      job: Job(''),
      employer: Employer(''),
      dateRange: DateRange(since: null, until: null),
      description: domain.Description(''),
    ),
  );

  group('WorkExperienceFormBloc should', () {
    test('has empty as initial state', () {
      final bloc = WorkExperienceFormBloc();
      // assert
      expect(
        bloc.state,
        equals(initialState),
      );
    });

    blocTest<WorkExperienceFormBloc, WorkExperienceFormState>(
      'update job',
      build: () => WorkExperienceFormBloc(),
      seed: () => initialState,
      act: (bloc) => bloc
        ..add(const JobChanged('anyJob'))
        ..add(const JobChanged('otherJob')),
      expect: () => <WorkExperienceFormState>[
        initialState.copyWith(
          workExperience:
              initialState.workExperience.copyWith(job: Job('anyJob')),
        ),
        initialState.copyWith(
          workExperience:
              initialState.workExperience.copyWith(job: Job('otherJob')),
        ),
      ],
    );
    blocTest<WorkExperienceFormBloc, WorkExperienceFormState>(
      'update employer',
      build: () => WorkExperienceFormBloc(),
      seed: () => initialState,
      act: (bloc) => bloc
        ..add(const EmployerChanged('anyEmployer'))
        ..add(const EmployerChanged('otherEmployer')),
      expect: () => <WorkExperienceFormState>[
        initialState.copyWith(
          workExperience: initialState.workExperience
              .copyWith(employer: Employer('anyEmployer')),
        ),
        initialState.copyWith(
          workExperience: initialState.workExperience
              .copyWith(employer: Employer('otherEmployer')),
        ),
      ],
    );
    blocTest<WorkExperienceFormBloc, WorkExperienceFormState>(
      'update description',
      build: () => WorkExperienceFormBloc(),
      seed: () => initialState,
      act: (bloc) => bloc
        ..add(const DescriptionChanged('anyDescription'))
        ..add(const DescriptionChanged('otherDescription')),
      expect: () => <WorkExperienceFormState>[
        initialState.copyWith(
          workExperience: initialState.workExperience
              .copyWith(description: domain.Description('anyDescription')),
        ),
        initialState.copyWith(
          workExperience: initialState.workExperience
              .copyWith(description: domain.Description('otherDescription')),
        ),
      ],
    );
    blocTest<WorkExperienceFormBloc, WorkExperienceFormState>(
      'initialized with work experience',
      build: () => WorkExperienceFormBloc(),
      seed: () => initialState.copyWith(
        isLoaded: false,
        showErrorMessages: true,
        saveFailureOrSuccessOption: some(right(unit)),
      ),
      wait: const Duration(seconds: 1),
      act: (bloc) => bloc
        ..add(
          Initialized(
            some(
              WorkExperience(
                uniqueId: UniqueId.fromString('initialAnyId'),
                job: Job('initialJob'),
                employer: Employer('initialEmployer'),
                dateRange: DateRange(since: DateTime(2022), until: null),
                description: domain.Description('initialDescription'),
              ),
            ),
          ),
        ),
      expect: () => <WorkExperienceFormState>[
        WorkExperienceFormState(
          showErrorMessages: false,
          isLoaded: true,
          saveFailureOrSuccessOption: none(),
          workExperience: WorkExperience(
            uniqueId: UniqueId.fromString('initialAnyId'),
            job: Job('initialJob'),
            employer: Employer('initialEmployer'),
            dateRange: DateRange(since: DateTime(2022), until: null),
            description: domain.Description('initialDescription'),
          ),
        ),
        WorkExperienceFormState(
          showErrorMessages: false,
          isLoaded: false,
          saveFailureOrSuccessOption: none(),
          workExperience: WorkExperience(
            uniqueId: UniqueId.fromString('initialAnyId'),
            job: Job('initialJob'),
            employer: Employer('initialEmployer'),
            dateRange: DateRange(since: DateTime(2022), until: null),
            description: domain.Description('initialDescription'),
          ),
        ),
      ],
    );
    blocTest<WorkExperienceFormBloc, WorkExperienceFormState>(
      'not update work experience',
      build: () => WorkExperienceFormBloc(),
      seed: () => initialState,
      act: (bloc) => bloc
        ..add(
          Initialized(
            none(),
          ),
        ),
      expect: () => <WorkExperienceFormState>[],
    );
    blocTest<WorkExperienceFormBloc, WorkExperienceFormState>(
      'save work experience',
      build: () => WorkExperienceFormBloc(),
      seed: () => WorkExperienceFormState(
        showErrorMessages: false,
        isLoaded: false,
        saveFailureOrSuccessOption: none(),
        workExperience: WorkExperience(
          uniqueId: UniqueId.fromString('anyId'),
          job: Job('anyJob'),
          employer: Employer('anyEmployer'),
          dateRange: DateRange(since: DateTime(2022), until: null),
          description: domain.Description('anyDescription'),
        ),
      ),
      act: (bloc) => bloc..add(Saved()),
      expect: () => <WorkExperienceFormState>[
        WorkExperienceFormState(
          showErrorMessages: true,
          isLoaded: false,
          saveFailureOrSuccessOption: some(right(unit)),
          workExperience: WorkExperience(
            uniqueId: UniqueId.fromString('anyId'),
            job: Job('anyJob'),
            employer: Employer('anyEmployer'),
            dateRange: DateRange(since: DateTime(2022), until: null),
            description: domain.Description('anyDescription'),
          ),
        ),
      ],
    );
    blocTest<WorkExperienceFormBloc, WorkExperienceFormState>(
      'not allow save work experience is wrong',
      build: () => WorkExperienceFormBloc(),
      seed: () => initialState,
      act: (bloc) => bloc..add(Saved()),
      expect: () => <WorkExperienceFormState>[
        initialState.copyWith(
          showErrorMessages: true,
          saveFailureOrSuccessOption: some(left(const Empty<String>())),
        ),
      ],
    );

    blocTest<WorkExperienceFormBloc, WorkExperienceFormState>(
      'update date range',
      build: () => WorkExperienceFormBloc(),
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
      expect: () => <WorkExperienceFormState>[
        initialState.copyWith(
          workExperience: initialState.workExperience.copyWith(
              dateRange: DateRange(since: DateTime(2020, 2, 3), until: null)),
        ),
        initialState.copyWith(
          workExperience: initialState.workExperience.copyWith(
            dateRange: DateRange(
              since: DateTime(2020, 2, 3),
              until: DateTime(2020, 3, 5),
            ),
          ),
        ),
        initialState.copyWith(
          workExperience: initialState.workExperience.copyWith(
            dateRange: DateRange(since: DateTime(2020, 2, 3), until: null),
          ),
        ),
        initialState.copyWith(
          workExperience: initialState.workExperience.copyWith(
            dateRange: DateRange(since: DateTime(2021, 5, 11), until: null),
          ),
        ),
      ],
    );
  });
}
