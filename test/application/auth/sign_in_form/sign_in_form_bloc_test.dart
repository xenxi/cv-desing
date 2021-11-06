import 'package:cv_desing_website_flutter/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/password.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('signInForm should', () {
    test('be in empty state', () {
      final bloc = SignInFormBloc();

      final expectedEmptyState = SignInFormState(
          email: EmailAddress.empty(),
          password: Password.empty(),
          failureOrSuccessOption: none());
      expect(bloc.state, equals(expectedEmptyState));
    });
    blocTest<SignInFormBloc, SignInFormState>('update email when email changed',
        build: () => SignInFormBloc(),
        act: (bloc) {
          bloc.add(const EmailChanged('aGivenValidEmail@test.com'));
        },
        expect: () => <SignInFormState>[
              SignInFormState(
                  email: EmailAddress.create('aGivenValidEmail@test.com'),
                  password: Password.empty(),
                  failureOrSuccessOption: none())
            ]);

    blocTest<SignInFormBloc, SignInFormState>(
        'update password when password changed',
        build: () => SignInFormBloc(),
        act: (bloc) {
          bloc.add(const PasswordChanged('anyPassword'));
        },
        expect: () => <SignInFormState>[
              SignInFormState(
                  password: Password.create('anyPassword'),
                  email: EmailAddress.empty(),
                  failureOrSuccessOption: none())
            ]);

    blocTest<SignInFormBloc, SignInFormState>(
        'signIn user with email and password',
        build: () => SignInFormBloc(),
        act: (bloc) {
          bloc.add(const PasswordChanged('anyValidPassword'));
          bloc.add(const EmailChanged('anyValidEmail@gmail.com'));
          bloc.add(const SignInWithEmailAndPasswordPressed());
        },
        expect: () => <SignInFormState>[
              SignInFormState(
                  password: Password.create('anyValidPassword'),
                  email: EmailAddress.create('anyValidEmail@gmail.com'),
                  failureOrSuccessOption: some(right(unit)))
            ]);
  });
}
