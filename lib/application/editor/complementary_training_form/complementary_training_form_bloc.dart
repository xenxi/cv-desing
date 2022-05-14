// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/domain/complementary_training.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/schoold.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'complementary_training_form_event.dart';
part 'complementary_training_form_state.dart';

@injectable
class ComplementaryTrainingFormBloc extends Bloc<ComplementaryTrainingFormEvent,
    ComplementaryTrainingFormState> {
  ComplementaryTrainingFormBloc()
      : super(ComplementaryTrainingFormState.initial()) {
    on<ComplementaryTrainingFormEvent>((event, emit) async {
      if (event is TitleChanged) {
        emit(
          state.copyWith(
            complementaryTraining: state.complementaryTraining.copyWith(
              title: Title(event.title),
            ),
          ),
        );
      } else if (event is DateRangeChanged) {
        emit(
          state.copyWith(
            complementaryTraining: state.complementaryTraining.copyWith(
              dateRange: DateRange(since: event.since, until: event.until),
            ),
          ),
        );
      } else if (event is SchooldChanged) {
        emit(
          state.copyWith(
            complementaryTraining: state.complementaryTraining.copyWith(
              schoold: Schoold(event.shoold),
            ),
          ),
        );
      } else if (event is Saved) {
        final Either<Failure, Unit> failureOrSuccess = state
            .complementaryTraining.failureOption
            .fold(() => right(unit), (a) => left(a));

        emit(
          state.copyWith(
            saveFailureOrSuccessOption: some(failureOrSuccess),
            showErrorMessages: true,
          ),
        );
      } else if (event is Initialized) {
        emit(
          event.complementaryTraining.fold(
            () => state,
            (complementaryTraining) => state.copyWith(
              isLoaded: true,
              complementaryTraining: complementaryTraining,
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
