// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/application/components/image_picker.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/personal_information.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/locality.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/name.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'personal_information_form_event.dart';
part 'personal_information_form_state.dart';

@injectable
class PersonalInformationFormBloc
    extends Bloc<PersonalInformationFormEvent, PersonalInformationFormState> {
  PersonalInformationFormBloc(this._imagePicker)
      : super(PersonalInformationFormState.initial()) {
    on<PersonalInformationFormEvent>((event, emit) async {
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
      } else if (event is AvatarChanged) {
        final imageOption = await _imagePicker.pickImage();
        emit(
          state.copyWith(
            personalInformation: state.personalInformation.copyWith(
              avatarOption: imageOption,
            ),
          ),
        );
      } else if (event is AvatarDeleted) {
        emit(
          state.copyWith(
            personalInformation: state.personalInformation.copyWith(
              avatarOption: none(),
            ),
          ),
        );
      }
    });
  }
  final ImagePicker _imagePicker;
}
