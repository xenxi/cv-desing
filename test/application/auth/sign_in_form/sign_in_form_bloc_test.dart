import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/auth/i_auth_facade.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/password.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIAuthFacade extends Mock implements IAuthFacade {}

void main() {
  const anyValidEmail = 'anyValidEmail@test.com';
  final anyValidEmailOrFailure = EmailAddress.create(anyValidEmail);
  final anyInvalidEmailOrFailure = EmailAddress.empty();

  const anyValidPassword = 'anyValidPassword';
  final anyValidPasswordOrFailure = Password.create(anyValidPassword);
  final anyInvalidPasswordOrFailure = Password.empty();

  late MockIAuthFacade authFacade;

  setUp(() {
    authFacade = MockIAuthFacade();
  });

  group('signInForm should', () {
    test('be in empty state', () {
      final bloc = SignInFormBloc(authFacade);

      final expectedEmptyState = SignInFormState(
        email: EmailAddress.empty(),
        password: Password.empty(),
        showErrorMessages: false,
        showLoader: false,
        failureOrSuccessOption: none(),
      );
      expect(bloc.state, equals(expectedEmptyState));
    });

    blocTest<SignInFormBloc, SignInFormState>(
      'signIn user with email and password',
      build: () => SignInFormBloc(authFacade),
      setUp: () {
        when(
          () => authFacade.signInWithEmailAndPassword(
            email: anyValidEmailOrFailure.getOrCrash(),
            password: anyValidPasswordOrFailure.getOrCrash(),
          ),
        ).thenAnswer((_) => Future.value(right(unit)));
      },
      act: (bloc) {
        bloc.add(const EmailChanged(anyValidEmail));
        bloc.add(const PasswordChanged(anyValidPassword));
        bloc.add(const SignInWithEmailAndPasswordPressed());
      },
      verify: (_) {
        verify(
          () => authFacade.signInWithEmailAndPassword(
            email: anyValidEmailOrFailure.getOrCrash(),
            password: anyValidPasswordOrFailure.getOrCrash(),
          ),
        ).called(1);
      },
      expect: () => <SignInFormState>[
        SignInFormState(
          email: anyValidEmailOrFailure,
          password: Password.empty(),
          showErrorMessages: false,
          showLoader: false,
          failureOrSuccessOption: none(),
        ),
        SignInFormState(
          password: anyValidPasswordOrFailure,
          email: anyValidEmailOrFailure,
          showErrorMessages: false,
          showLoader: false,
          failureOrSuccessOption: none(),
        ),
        SignInFormState(
          password: anyValidPasswordOrFailure,
          email: anyValidEmailOrFailure,
          showErrorMessages: false,
          showLoader: true,
          failureOrSuccessOption: none(),
        ),
        SignInFormState(
          password: anyValidPasswordOrFailure,
          email: anyValidEmailOrFailure,
          showErrorMessages: true,
          showLoader: false,
          failureOrSuccessOption: some(right(unit)),
        )
      ],
    );
    blocTest<SignInFormBloc, SignInFormState>(
      'signIn user with google',
      build: () => SignInFormBloc(authFacade),
      setUp: () => when(
        () => authFacade.signInWithGoogle(),
      ).thenAnswer((_) => Future.value(right(unit))),
      act: (bloc) => bloc.add(const SignInWithGooglePressed()),
      verify: (_) => verify(() => authFacade.signInWithGoogle()).called(1),
      expect: () => <SignInFormState>[
        SignInFormState(
          password: Password.empty(),
          email: EmailAddress.empty(),
          showErrorMessages: false,
          showLoader: true,
          failureOrSuccessOption: none(),
        ),
        SignInFormState(
          password: Password.empty(),
          email: EmailAddress.empty(),
          showErrorMessages: true,
          showLoader: false,
          failureOrSuccessOption: some(right(unit)),
        )
      ],
    );
    blocTest<SignInFormBloc, SignInFormState>(
      'show error on signIn when email is invalid',
      build: () => SignInFormBloc(authFacade),
      act: (bloc) {
        bloc.add(const PasswordChanged(anyValidPassword));
        bloc.add(const SignInWithEmailAndPasswordPressed());
      },
      expect: () => <SignInFormState>[
        SignInFormState(
          password: anyValidPasswordOrFailure,
          email: anyInvalidEmailOrFailure,
          showErrorMessages: false,
          showLoader: false,
          failureOrSuccessOption: none(),
        ),
        SignInFormState(
          password: anyValidPasswordOrFailure,
          email: anyInvalidEmailOrFailure,
          showErrorMessages: true,
          showLoader: false,
          failureOrSuccessOption: none(),
        )
      ],
    );
    blocTest<SignInFormBloc, SignInFormState>(
      'show error on signIn when password is invalid',
      build: () => SignInFormBloc(authFacade),
      act: (bloc) {
        bloc.add(const EmailChanged(anyValidEmail));
        bloc.add(const SignInWithEmailAndPasswordPressed());
      },
      expect: () => <SignInFormState>[
        SignInFormState(
          password: anyInvalidPasswordOrFailure,
          email: anyValidEmailOrFailure,
          showErrorMessages: false,
          showLoader: false,
          failureOrSuccessOption: none(),
        ),
        SignInFormState(
          password: anyInvalidPasswordOrFailure,
          email: anyValidEmailOrFailure,
          showErrorMessages: true,
          showLoader: false,
          failureOrSuccessOption: none(),
        )
      ],
    );
  });
}
