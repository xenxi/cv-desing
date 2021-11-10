part of 'sign_in_form_bloc.dart';

@immutable
abstract class SignInFormEvent extends Equatable {
  const SignInFormEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends SignInFormEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends SignInFormEvent {
  const PasswordChanged(this.password);

  final String password;

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

class SignUpWithEmailAndPasswordPressed extends SignInFormEvent {
  const SignUpWithEmailAndPasswordPressed();
  @override
  List<Object> get props => [];
}
