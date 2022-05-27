part of 'contact_information_form_bloc.dart';

class ContactInformationFormState extends Equatable {
  factory ContactInformationFormState.initial() => ContactInformationFormState(
        contactInformation: ContactInformation.empty(),
        showErrorMessages: false,
        isLoaded: false,
        saveFailureOrSuccessOption: none(),
      );
  const ContactInformationFormState(
      {required this.contactInformation,
      required this.showErrorMessages,
      required this.isLoaded,
      required this.saveFailureOrSuccessOption});

  final ContactInformation contactInformation;
  final bool showErrorMessages;
  final bool isLoaded;
  final Option<Either<Failure, Unit>> saveFailureOrSuccessOption;

  @override
  List<Object> get props => [
        contactInformation,
        showErrorMessages,
        isLoaded,
        saveFailureOrSuccessOption,
      ];

  ContactInformationFormState copyWith({
    ContactInformation? contactInformation,
    bool? showErrorMessages,
    bool? isLoaded,
    Option<Either<Failure, Unit>>? saveFailureOrSuccessOption,
  }) {
    return ContactInformationFormState(
      contactInformation: contactInformation ?? this.contactInformation,
      showErrorMessages: showErrorMessages ?? this.showErrorMessages,
      isLoaded: isLoaded ?? this.isLoaded,
      saveFailureOrSuccessOption:
          saveFailureOrSuccessOption ?? this.saveFailureOrSuccessOption,
    );
  }
}
