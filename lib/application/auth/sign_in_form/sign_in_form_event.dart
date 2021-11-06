part of 'sign_in_form_bloc.dart';

@immutable
abstract class SignInFormEvent extends Equatable {
  const SignInFormEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends SignInFormEvent {
  final String email;

  const EmailChanged(this.email);
  @override
  List<Object> get props => [email];
}
