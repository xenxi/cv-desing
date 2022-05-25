// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/work_experience.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/employer.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'work_experience_form_event.dart';
part 'work_experience_form_state.dart';

class WorkExperienceFormBloc
    extends Bloc<WorkExperienceFormEvent, WorkExperienceFormState> {
  WorkExperienceFormBloc() : super(WorkExperienceFormState.initial()) {
    on<WorkExperienceFormEvent>((event, emit) async {
      if (event is JobChanged) {
        emit(
          state.copyWith(
            workExperience: state.workExperience.copyWith(
              job: Job(event.job),
            ),
          ),
        );
      } else if (event is EmployerChanged) {
        emit(
          state.copyWith(
            workExperience: state.workExperience.copyWith(
              employer: Employer(event.employer),
            ),
          ),
        );
      } else if (event is DescriptionChanged) {
        emit(
          state.copyWith(
            workExperience: state.workExperience.copyWith(
              description: Description(event.description),
            ),
          ),
        );
      } else if (event is DateRangeChanged) {
        emit(
          state.copyWith(
            workExperience: state.workExperience.copyWith(
              dateRange: DateRange(since: event.since, until: event.until),
            ),
          ),
        );
      } else if (event is Saved) {
        final Either<Failure, Unit> failureOrSuccess = state
            .workExperience.failureOption
            .fold(() => right(unit), (a) => left(a));

        emit(
          state.copyWith(
            saveFailureOrSuccessOption: some(failureOrSuccess),
            showErrorMessages: true,
          ),
        );
      } else if (event is Initialized) {
        emit(
          event.workExperienceOption.fold(
            () => state,
            (workExperience) => state.copyWith(
              isLoaded: true,
              showErrorMessages: false,
              saveFailureOrSuccessOption: none(),
              workExperience: workExperience,
            ),
          ),
        );
        await Future.delayed(const Duration(seconds: 1)).then((_) {
          emit(state.copyWith(isLoaded: false));
        });
      }
    });
  }
}
