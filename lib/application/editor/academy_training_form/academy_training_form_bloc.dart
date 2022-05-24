// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/schoold.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'academy_training_form_event.dart';
part 'academy_training_form_state.dart';

@injectable
class AcademyTrainingFormBloc
    extends Bloc<AcademyTrainingFormEvent, AcademyTrainingFormState> {
  AcademyTrainingFormBloc() : super(AcademyTrainingFormState.initial()) {
    on<AcademyTrainingFormEvent>((event, emit) async {
      if (event is TitleChanged) {
        emit(
          state.copyWith(
            academyTraining: state.academyTraining.copyWith(
              title: Title(event.title),
            ),
          ),
        );
      } else if (event is DateRangeChanged) {
        emit(
          state.copyWith(
            academyTraining: state.academyTraining.copyWith(
              dateRange: DateRange(since: event.since, until: event.until),
            ),
          ),
        );
      } else if (event is SchooldChanged) {
        emit(
          state.copyWith(
            academyTraining: state.academyTraining.copyWith(
              schoold: Schoold(event.shoold),
            ),
          ),
        );
      } else if (event is Saved) {
        final Either<Failure, Unit> failureOrSuccess = state
            .academyTraining.failureOption
            .fold(() => right(unit), (a) => left(a));

        emit(
          state.copyWith(
            saveFailureOrSuccessOption: some(failureOrSuccess),
            showErrorMessages: true,
          ),
        );
      } else if (event is Initialized) {
        emit(
          event.ademyTraining.fold(
            () => state,
            (academyTraining) => state.copyWith(
              isLoaded: true,
              showErrorMessages: false,
              academyTraining: academyTraining,
              saveFailureOrSuccessOption: none(),
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
