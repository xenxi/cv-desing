import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/contact_information.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/phone_number.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final initialState = ContactInformationFormState(
    contactInformation: ContactInformation(
      emailAddress: EmailAddress(''),
      phoneNumber: PhoneNumber(''),
    ),
    showErrorMessages: false,
    isLoaded: false,
    saveFailureOrSuccessOption: none(),
  );
  group('ContactInformationFormBloc should', () {
    test('has empty as initial state', () {
      final bloc = ContactInformationFormBloc();
      // assert
      expect(
        bloc.state,
        equals(initialState),
      );
    });
  });
}