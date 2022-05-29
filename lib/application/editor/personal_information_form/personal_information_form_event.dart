part of 'personal_information_form_bloc.dart';

abstract class PersonalInformationFormEvent extends Equatable {
  const PersonalInformationFormEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends PersonalInformationFormEvent {
  const NameChanged(
    this.name,
  );
  final String name;

  @override
  List<Object> get props => [name];
}

class LocalityChanged extends PersonalInformationFormEvent {
  const LocalityChanged(
    this.locality,
  );
  final String locality;

  @override
  List<Object> get props => [locality];
}

class ProfessionChanged extends PersonalInformationFormEvent {
  const ProfessionChanged(
    this.profession,
  );
  final String profession;

  @override
  List<Object> get props => [profession];
}

class PersonalDescriptionChanged extends PersonalInformationFormEvent {
  const PersonalDescriptionChanged(
    this.personalDescription,
  );
  final String personalDescription;

  @override
  List<Object> get props => [personalDescription];
}

class Saved extends PersonalInformationFormEvent {
  @override
  List<Object> get props => [];
}

class AvatarChanged extends PersonalInformationFormEvent {
  @override
  List<Object> get props => [];
}

class AvatarDeleted extends PersonalInformationFormEvent {
  @override
  List<Object> get props => [];
}
