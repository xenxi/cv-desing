part of 'sign_in_form_bloc.dart';

class SignInFormState extends Equatable {
  factory SignInFormState.initial() => SignInFormState(
        email: EmailAddress.empty(),
        password: Password.empty(),
        showErrorMessages: false,
        showLoader: false,
        failureOrSuccessOption: none(),
      );
  const SignInFormState({
    required this.email,
    required this.password,
    required this.failureOrSuccessOption,
    required this.showErrorMessages,
    required this.showLoader,
  });

  final EmailAddress email;
  final Password password;
  final Option<Either<AuthFailure, Unit>> failureOrSuccessOption;
  final bool showErrorMessages;
  final bool showLoader;

  @override
  List<Object> get props =>
      [email, password, failureOrSuccessOption, showErrorMessages, showLoader];

  SignInFormState copyWith({
    EmailAddress? email,
    Password? password,
    Option<Either<AuthFailure, Unit>>? failureOrSuccessOption,
    bool? showErrorMessages,
    bool? showLoader,
  }) {
    return SignInFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      failureOrSuccessOption:
          failureOrSuccessOption ?? this.failureOrSuccessOption,
      showErrorMessages: showErrorMessages ?? this.showErrorMessages,
      showLoader: showLoader ?? this.showLoader,
    );
  }
}
