part of 'contact_information_form_bloc.dart';

abstract class ContactInformationFormEvent extends Equatable {
  const ContactInformationFormEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends ContactInformationFormEvent {
  const EmailChanged(
    this.email,
  );
  final String email;

  @override
  List<Object> get props => [email];
}

class PhoneNumberChanged extends ContactInformationFormEvent {
  const PhoneNumberChanged(
    this.phoneNumber,
  );
  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class Saved extends ContactInformationFormEvent {
  @override
  List<Object> get props => [];
}
