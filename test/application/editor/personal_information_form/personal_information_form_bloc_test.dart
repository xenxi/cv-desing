import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/personal_information.dart';
import 'package:cv_desing_website_flutter/domain/value_failures.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart'
    as domain;
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/locality.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/name.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final initialState = PersonalInformationFormState(
    personalInformation: PersonalInformation(
      description: domain.Description(''),
      name: Name(''),
      locality: Locality(''),
      job: Job(''),
    ),
    showErrorMessages: false,
    isLoaded: false,
    saveFailureOrSuccessOption: none(),
  );

  group('PersonalInformationFormBloc should', () {
    test('has empty as initial state', () {
      final bloc = PersonalInformationFormBloc();
      // assert
      expect(
        bloc.state,
        equals(
          initialState,
        ),
      );
    });

    blocTest<PersonalInformationFormBloc, PersonalInformationFormState>(
      'update name',
      build: () => PersonalInformationFormBloc(),
      act: (bloc) => bloc
        ..add(const NameChanged('anyName'))
        ..add(const NameChanged('otherName')),
      expect: () => <PersonalInformationFormState>[
        initialState.copyWith(
          personalInformation: initialState.personalInformation.copyWith(
            name: Name('anyName'),
          ),
        ),
        initialState.copyWith(
          personalInformation: initialState.personalInformation.copyWith(
            name: Name('otherName'),
          ),
        ),
      ],
    );
    blocTest<PersonalInformationFormBloc, PersonalInformationFormState>(
      'update locality',
      build: () => PersonalInformationFormBloc(),
      act: (bloc) => bloc
        ..add(const LocalityChanged('anyLocality'))
        ..add(const LocalityChanged('otherLocality')),
      expect: () => <PersonalInformationFormState>[
        initialState.copyWith(
          personalInformation: initialState.personalInformation.copyWith(
            locality: Locality('anyLocality'),
          ),
        ),
        initialState.copyWith(
          personalInformation: initialState.personalInformation.copyWith(
            locality: Locality('otherLocality'),
          ),
        ),
      ],
    );
    blocTest<PersonalInformationFormBloc, PersonalInformationFormState>(
      'update profession',
      build: () => PersonalInformationFormBloc(),
      act: (bloc) => bloc
        ..add(const ProfessionChanged('anyProfession'))
        ..add(const ProfessionChanged('otherProfession')),
      expect: () => <PersonalInformationFormState>[
        initialState.copyWith(
          personalInformation: initialState.personalInformation.copyWith(
            job: Job('anyProfession'),
          ),
        ),
        initialState.copyWith(
          personalInformation: initialState.personalInformation.copyWith(
            job: Job('otherProfession'),
          ),
        ),
      ],
    );
    blocTest<PersonalInformationFormBloc, PersonalInformationFormState>(
      'update personal description',
      build: () => PersonalInformationFormBloc(),
      act: (bloc) => bloc
        ..add(const PersonalDescriptionChanged('anyPersonalDescription'))
        ..add(const PersonalDescriptionChanged('otherPersonalDescription')),
      expect: () => <PersonalInformationFormState>[
        initialState.copyWith(
          personalInformation: initialState.personalInformation.copyWith(
            description: domain.Description('anyPersonalDescription'),
          ),
        ),
        initialState.copyWith(
          personalInformation: initialState.personalInformation.copyWith(
            description: domain.Description('otherPersonalDescription'),
          ),
        ),
      ],
    );

    blocTest<PersonalInformationFormBloc, PersonalInformationFormState>(
      'save contact information',
      build: () => PersonalInformationFormBloc(),
      seed: () => PersonalInformationFormState(
        isLoaded: false,
        showErrorMessages: false,
        saveFailureOrSuccessOption: none(),
        personalInformation: PersonalInformation(
          description: domain.Description('anyDescription'),
          name: Name('anyName'),
          locality: Locality('anyLocality'),
          job: Job('anyProfession'),
        ),
      ),
      act: (bloc) => bloc..add(Saved()),
      expect: () => <PersonalInformationFormState>[
        PersonalInformationFormState(
          isLoaded: false,
          showErrorMessages: true,
          saveFailureOrSuccessOption: some(right(unit)),
          personalInformation: PersonalInformation(
            description: domain.Description('anyDescription'),
            name: Name('anyName'),
            locality: Locality('anyLocality'),
            job: Job('anyProfession'),
          ),
        ),
      ],
    );

    blocTest<PersonalInformationFormBloc, PersonalInformationFormState>(
      'not allow save contact information is wrong',
      build: () => PersonalInformationFormBloc(),
      seed: () => initialState,
      act: (bloc) => bloc..add(Saved()),
      expect: () => <PersonalInformationFormState>[
        initialState.copyWith(
          showErrorMessages: true,
          saveFailureOrSuccessOption: some(left(const Empty<String>())),
        ),
      ],
    );
  });
}
