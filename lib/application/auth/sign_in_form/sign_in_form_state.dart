part of 'sign_in_form_bloc.dart';

abstract class SignInFormState extends Equatable {
  final Either<Failure, EmailAddress> email;

  const SignInFormState({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}

class Empty extends SignInFormState {
  Empty() : super(email: EmailAddress.create(''));
}
