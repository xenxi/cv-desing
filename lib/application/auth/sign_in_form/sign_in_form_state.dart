part of 'sign_in_form_bloc.dart';

class SignInFormState extends Equatable {
  final Either<Failure, EmailAddress> email;

  const SignInFormState({
    required this.email,
  });

  @override
  List<Object> get props => [email];

  factory SignInFormState.initial() =>
      SignInFormState(email: EmailAddress.create(''));
}
