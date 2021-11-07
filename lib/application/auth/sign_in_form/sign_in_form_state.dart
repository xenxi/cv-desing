part of 'sign_in_form_bloc.dart';

class SignInFormState extends Equatable {
  final Either<Failure, EmailAddress> email;
  final Either<Failure, Password> password;
  final Option<Either<AuthFailure, Unit>> failureOrSuccessOption;

  const SignInFormState({
    required this.email,
    required this.password,
    required this.failureOrSuccessOption,
  });

  @override
  List<Object> get props => [email, password, failureOrSuccessOption];

  factory SignInFormState.initial() => SignInFormState(
      email: EmailAddress.empty(),
      password: Password.empty(),
      failureOrSuccessOption: none());

  SignInFormState copyWith({
    Either<Failure, EmailAddress>? email,
    Either<Failure, Password>? password,
    Option<Either<AuthFailure, Unit>>? failureOrSuccessOption,
  }) {
    return SignInFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      failureOrSuccessOption:
          failureOrSuccessOption ?? this.failureOrSuccessOption,
    );
  }
}
