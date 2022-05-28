part of 'personal_information_form_bloc.dart';

class PersonalInformationFormState extends Equatable {
  factory PersonalInformationFormState.initial() =>
      PersonalInformationFormState(
        personalInformation: PersonalInformation.empty(),
        showErrorMessages: false,
        isLoaded: false,
        saveFailureOrSuccessOption: none(),
      );
  const PersonalInformationFormState({
    required this.personalInformation,
    required this.showErrorMessages,
    required this.isLoaded,
    required this.saveFailureOrSuccessOption,
  });
  final PersonalInformation personalInformation;
  final bool showErrorMessages;
  final bool isLoaded;
  final Option<Either<Failure, Unit>> saveFailureOrSuccessOption;
  @override
  List<Object> get props => [
        personalInformation,
        showErrorMessages,
        isLoaded,
        saveFailureOrSuccessOption,
      ];

  PersonalInformationFormState copyWith({
    PersonalInformation? personalInformation,
    bool? showErrorMessages,
    bool? isLoaded,
    Option<Either<Failure, Unit>>? saveFailureOrSuccessOption,
  }) {
    return PersonalInformationFormState(
      personalInformation: personalInformation ?? this.personalInformation,
      showErrorMessages: showErrorMessages ?? this.showErrorMessages,
      isLoaded: isLoaded ?? this.isLoaded,
      saveFailureOrSuccessOption:
          saveFailureOrSuccessOption ?? this.saveFailureOrSuccessOption,
    );
  }
}
