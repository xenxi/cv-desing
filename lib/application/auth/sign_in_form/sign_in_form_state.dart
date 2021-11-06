part of 'sign_in_form_bloc.dart';

class SignInFormState extends Equatable {
  final Either<Failure, EmailAddress> email;
  final Either<Failure, Password> password;

  const SignInFormState({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];

  factory SignInFormState.initial() =>
      SignInFormState(email: EmailAddress.empty(), password: Password.empty());
}
