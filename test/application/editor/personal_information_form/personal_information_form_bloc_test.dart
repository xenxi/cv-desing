import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/components/image_picker.dart';
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
import 'package:mocktail/mocktail.dart';

class MockImagePicker extends Mock implements ImagePicker {}

void main() {
  late MockImagePicker mockImagePicker;
  late PersonalInformationFormBloc bloc;
  setUp(() {
    mockImagePicker = MockImagePicker();
    bloc = PersonalInformationFormBloc(mockImagePicker);
  });

  final initialState = PersonalInformationFormState(
    personalInformation: PersonalInformation(
      description: domain.Description(''),
      name: Name(''),
      locality: Locality(''),
      job: Job(''),
      avatarOption: none(),
    ),
    showErrorMessages: false,
    isLoaded: false,
    saveFailureOrSuccessOption: none(),
  );

  group('PersonalInformationFormBloc should', () {
    test('has empty as initial state', () {
      expect(
        bloc.state,
        equals(
          initialState,
        ),
      );
    });

    blocTest<PersonalInformationFormBloc, PersonalInformationFormState>(
      'update name',
      build: () => bloc,
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
      build: () => bloc,
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
      build: () => bloc,
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
      build: () => bloc,
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
    final anyImage = Uint8List(50);
    blocTest<PersonalInformationFormBloc, PersonalInformationFormState>(
      'update avatar option',
      build: () => bloc,
      setUp: () => when(() => mockImagePicker.pickImage())
          .thenAnswer((_) => Future.value(some(anyImage))),
      act: (bloc) => bloc..add(AvatarChanged()),
      expect: () => <PersonalInformationFormState>[
        initialState.copyWith(
          personalInformation: initialState.personalInformation.copyWith(
            avatarOption: some(anyImage),
          ),
        ),
      ],
    );
    blocTest<PersonalInformationFormBloc, PersonalInformationFormState>(
      'clear avatar option',
      build: () => bloc,
      seed: () => initialState.copyWith(
        personalInformation: initialState.personalInformation.copyWith(
          avatarOption: some(anyImage),
        ),
      ),
      act: (bloc) => bloc..add(AvatarDeleted()),
      expect: () => <PersonalInformationFormState>[
        initialState.copyWith(
          personalInformation: initialState.personalInformation.copyWith(
            avatarOption: none(),
          ),
        ),
      ],
    );

    blocTest<PersonalInformationFormBloc, PersonalInformationFormState>(
      'save contact information',
      build: () => bloc,
      seed: () => PersonalInformationFormState(
        isLoaded: false,
        showErrorMessages: false,
        saveFailureOrSuccessOption: none(),
        personalInformation: PersonalInformation(
          description: domain.Description('anyDescription'),
          name: Name('anyName'),
          locality: Locality('anyLocality'),
          job: Job('anyProfession'),
          avatarOption: none(),
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
            avatarOption: none(),
          ),
        ),
      ],
    );

    blocTest<PersonalInformationFormBloc, PersonalInformationFormState>(
      'not allow save contact information is wrong',
      build: () => bloc,
      seed: () => initialState,
      act: (bloc) => bloc..add(Saved()),
      expect: () => <PersonalInformationFormState>[
        initialState.copyWith(
          showErrorMessages: true,
          saveFailureOrSuccessOption: some(left(const Empty<String>())),
        ),
      ],
    );

    blocTest<PersonalInformationFormBloc, PersonalInformationFormState>(
      'load contact information',
      build: () => bloc,
      seed: () => initialState.copyWith(
        isLoaded: false,
      ),
      act: (bloc) => bloc
        ..add(
          PersonalInformationLoaded(
            PersonalInformation.empty()
                .copyWith(description: domain.Description('anyDescription')),
          ),
        ),
      expect: () => <PersonalInformationFormState>[
        initialState.copyWith(
          isLoaded: true,
          personalInformation: PersonalInformation.empty()
              .copyWith(description: domain.Description('anyDescription')),
        ),
      ],
    );
  });
}
