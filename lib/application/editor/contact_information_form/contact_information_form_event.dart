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
