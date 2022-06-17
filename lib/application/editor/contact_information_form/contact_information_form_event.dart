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

class FacebookUrlChanged extends ContactInformationFormEvent {
  const FacebookUrlChanged(
    this.url,
  );
  final String url;

  @override
  List<Object> get props => [url];
}

class LinkedinUrlChanged extends ContactInformationFormEvent {
  const LinkedinUrlChanged(this.url);
  final String url;
  @override
  List<Object> get props => [url];
}

class TwitterUrlChanged extends ContactInformationFormEvent {
  const TwitterUrlChanged(this.url);
  final String url;
  @override
  List<Object> get props => [url];
}

class GithubUrlChanged extends ContactInformationFormEvent {
  const GithubUrlChanged(this.url);
  final String url;
  @override
  List<Object> get props => [url];
}

class InstagramUrlChanged extends ContactInformationFormEvent {
  const InstagramUrlChanged(this.url);
  final String url;
  @override
  List<Object> get props => [url];
}

class YoutubeUrlChanged extends ContactInformationFormEvent {
  const YoutubeUrlChanged(this.url);
  final String url;
  @override
  List<Object> get props => [url];
}

class TwitchUrlChanged extends ContactInformationFormEvent {
  const TwitchUrlChanged(this.url);
  final String url;
  @override
  List<Object> get props => [url];
}

class PersonalUrlChanged extends ContactInformationFormEvent {
  const PersonalUrlChanged(this.url);
  final String url;
  @override
  List<Object> get props => [url];
}
