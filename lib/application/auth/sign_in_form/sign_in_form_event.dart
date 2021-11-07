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

class PasswordChanged extends SignInFormEvent {
  final String password;

  const PasswordChanged(this.password);
  @override
  List<Object> get props => [password];
}

class SignInWithEmailAndPasswordPressed extends SignInFormEvent {
  const SignInWithEmailAndPasswordPressed();
  @override
  List<Object> get props => [];
}

class SignInWithGooglePressed extends SignInFormEvent {
  const SignInWithGooglePressed();
  @override
  List<Object> get props => [];
}
