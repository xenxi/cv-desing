// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/domain/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/schoold.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:equatable/equatable.dart';

part 'academy_training_form_event.dart';
part 'academy_training_form_state.dart';

class AcademyTrainingFormBloc
    extends Bloc<AcademyTrainingFormEvent, AcademyTrainingFormState> {
  AcademyTrainingFormBloc() : super(AcademyTrainingFormState.initial()) {
    on<AcademyTrainingFormEvent>((event, emit) {
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
      }
    });
  }
}
