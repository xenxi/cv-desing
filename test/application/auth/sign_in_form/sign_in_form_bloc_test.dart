import 'package:cv_desing_website_flutter/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  late SignInFormBloc bloc;

  setUp(() {
    bloc = SignInFormBloc();
  });
  tearDown(() {
    bloc.close();
  });
  group('signInForm should', () {
    test('be in empty state', () {
      expect(bloc.state, equals(Empty()));
    });
    blocTest<SignInFormBloc, SignInFormState>('update email when email changed',
        build: () => SignInFormBloc(),
        act: (bloc) {
          bloc.add(const EmailChanged('aGivenValidEmail@test.com'));
        },
        expect: () => <SignInFormState>[
              SignInFormState(
                  email: EmailAddress.create('aGivenValidEmail@test.com'))
            ]);
  });
}
