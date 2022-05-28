import 'package:bloc_test/bloc_test.dart';
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

    blocTest<ContactInformationFormBloc, ContactInformationFormState>(
      'update email',
      build: () => ContactInformationFormBloc(),
      act: (bloc) => bloc
        ..add(const EmailChanged('anyEmail'))
        ..add(const EmailChanged('otherEmail')),
      expect: () => <ContactInformationFormState>[
        initialState.copyWith(
          contactInformation: initialState.contactInformation.copyWith(
            emailAddress: EmailAddress('anyEmail'),
          ),
        ),
        initialState.copyWith(
          contactInformation: initialState.contactInformation.copyWith(
            emailAddress: EmailAddress('otherEmail'),
          ),
        ),
      ],
    );
    blocTest<ContactInformationFormBloc, ContactInformationFormState>(
      'update phone number',
      build: () => ContactInformationFormBloc(),
      act: (bloc) => bloc
        ..add(const PhoneNumberChanged('anyPhoneNumber'))
        ..add(const PhoneNumberChanged('otherPhoneNumber')),
      expect: () => <ContactInformationFormState>[
        initialState.copyWith(
          contactInformation: initialState.contactInformation.copyWith(
            phoneNumber: PhoneNumber('anyPhoneNumber'),
          ),
        ),
        initialState.copyWith(
          contactInformation: initialState.contactInformation.copyWith(
            phoneNumber: PhoneNumber('otherPhoneNumber'),
          ),
        ),
      ],
    );
  });

  blocTest<ContactInformationFormBloc, ContactInformationFormState>(
    'save contact information',
    build: () => ContactInformationFormBloc(),
    seed: () => ContactInformationFormState(
      isLoaded: false,
      showErrorMessages: false,
      saveFailureOrSuccessOption: none(),
      contactInformation: ContactInformation(
        emailAddress: EmailAddress('email@valid.com'),
        phoneNumber: PhoneNumber('654654673'),
      ),
    ),
    act: (bloc) => bloc..add(Saved()),
    expect: () => <ContactInformationFormState>[
      ContactInformationFormState(
        isLoaded: false,
        showErrorMessages: true,
        saveFailureOrSuccessOption: some(right(unit)),
        contactInformation: ContactInformation(
          emailAddress: EmailAddress('email@valid.com'),
          phoneNumber: PhoneNumber('654654673'),
        ),
      ),
    ],
  );
}
