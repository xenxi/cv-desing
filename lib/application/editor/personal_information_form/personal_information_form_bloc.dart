// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/personal_information.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/locality.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/name.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'personal_information_form_event.dart';
part 'personal_information_form_state.dart';

class PersonalInformationFormBloc
    extends Bloc<PersonalInformationFormEvent, PersonalInformationFormState> {
  PersonalInformationFormBloc()
      : super(PersonalInformationFormState.initial()) {
    on<PersonalInformationFormEvent>((event, emit) {
      if (event is NameChanged) {
        emit(
          state.copyWith(
            personalInformation: state.personalInformation.copyWith(
              name: Name(event.name),
            ),
          ),
        );
      } else if (event is LocalityChanged) {
        emit(
          state.copyWith(
            personalInformation: state.personalInformation.copyWith(
              locality: Locality(event.locality),
            ),
          ),
        );
      } else if (event is ProfessionChanged) {
        emit(
          state.copyWith(
            personalInformation: state.personalInformation.copyWith(
              job: Job(event.profession),
            ),
          ),
        );
      } else if (event is PersonalDescriptionChanged) {
        emit(
          state.copyWith(
            personalInformation: state.personalInformation.copyWith(
              description: Description(event.personalDescription),
            ),
          ),
        );
      } else if (event is Saved) {
        final Either<Failure, Unit> failureOrSuccess = state
            .personalInformation.failureOption
            .fold(() => right(unit), (a) => left(a));

        emit(
          state.copyWith(
            saveFailureOrSuccessOption: some(failureOrSuccess),
            showErrorMessages: true,
          ),
        );
      }
    });
  }
}
