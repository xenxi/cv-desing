import 'package:cv_desing_website_flutter/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SignInFormBloc bloc;

  setUp(() {
    bloc = SignInFormBloc();
  });

  group('signInForm should', () {
    test('be in empty state', () {
      expect(bloc.state, equals(Empty()));
    });

    test('update email', () {
      const validEmail = 'aGivenValidEmail@test.com';

      bloc.add(const EmailChanged(validEmail));

      final expectedEmailOrFailure = EmailAddress.create(validEmail);
      expect(bloc.state.email, equals(expectedEmailOrFailure));
    });
  });
}
