import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/auth/failures/email_address_failure.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/contact_information.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/social_media.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/phone_number.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/url.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final initialState = ContactInformationFormState(
    contactInformation: ContactInformation(
      emailAddress: EmailAddress(''),
      phoneNumber: PhoneNumber(''),
      socialMedias: SocialMedias.empty(),
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
      'update social media',
      build: () => ContactInformationFormBloc(),
      act: (bloc) => bloc
        ..add(const FacebookUrlChanged('www.facebook.com/any'))
        ..add(const LinkedinUrlChanged('www.linkedin.com/any'))
        ..add(const TwitterUrlChanged('www.twitter.com/any'))
        ..add(const GithubUrlChanged('www.github.com/any'))
        ..add(const InstagramUrlChanged('www.instagram.com/any'))
        ..add(const YoutubeUrlChanged('www.youtube.com/any'))
        ..add(const TwitchUrlChanged('www.twitch.com/any'))
        ..add(const PersonalUrlChanged('www.personal.com/any'))
        ..add(const FacebookUrlChanged(''))
        ..add(const FacebookUrlChanged(''))
        ..add(const LinkedinUrlChanged(''))
        ..add(const TwitterUrlChanged(''))
        ..add(const GithubUrlChanged(''))
        ..add(const InstagramUrlChanged(''))
        ..add(const YoutubeUrlChanged(''))
        ..add(const TwitchUrlChanged(''))
        ..add(const PersonalUrlChanged('')),
      // ,
      expect: () {
        final facebookUpdated = SocialMedias.empty().copyWith(
          facebookOption: some(Url('www.facebook.com/any')),
        );
        final linkedinUpdated = facebookUpdated.copyWith(
          linkedinOption: some(Url('www.linkedin.com/any')),
        );
        final twitterUpdated = linkedinUpdated.copyWith(
          twitterOption: some(Url('www.twitter.com/any')),
        );
        final githubUpdated = twitterUpdated.copyWith(
          githubOption: some(Url('www.github.com/any')),
        );
        final instagramUpdated = githubUpdated.copyWith(
          instagramOption: some(Url('www.instagram.com/any')),
        );
        final youtubeUpdated = instagramUpdated.copyWith(
          youtubeOption: some(Url('www.youtube.com/any')),
        );
        final twitchUpdated = youtubeUpdated.copyWith(
          twitchOption: some(Url('www.twitch.com/any')),
        );
        final personalUpdated = twitchUpdated.copyWith(
          personalOption: some(Url('www.personal.com/any')),
        );

        final facebookDeleted = personalUpdated.copyWith(
          facebookOption: none(),
        );
        final linkedinDeleted = facebookDeleted.copyWith(
          linkedinOption: none(),
        );
        final twitterDeleted = linkedinDeleted.copyWith(
          twitterOption: none(),
        );
        final githubDeleted = twitterDeleted.copyWith(
          githubOption: none(),
        );
        final instagramDeleted = githubDeleted.copyWith(
          instagramOption: none(),
        );
        final youtubeDeleted = instagramDeleted.copyWith(
          youtubeOption: none(),
        );
        final twitchDeleted = youtubeDeleted.copyWith(
          twitchOption: none(),
        );
        final personalDeleted = twitchDeleted.copyWith(
          personalOption: none(),
        );

        return <ContactInformationFormState>[
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: facebookUpdated),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: linkedinUpdated),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: twitterUpdated),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: githubUpdated),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: instagramUpdated),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: youtubeUpdated),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: twitchUpdated),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: personalUpdated),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: facebookDeleted),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: linkedinDeleted),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: twitterDeleted),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: githubDeleted),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: instagramDeleted),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: youtubeDeleted),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: twitchDeleted),
          ),
          initialState.copyWith(
            contactInformation: initialState.contactInformation
                .copyWith(socialMedias: personalDeleted),
          ),
        ];
      },
    );
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
        socialMedias: SocialMedias.empty().copyWith(
          facebookOption: some(Url('https://facebook.com')),
        ),
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
          socialMedias: SocialMedias.empty().copyWith(
            facebookOption: some(Url('https://facebook.com')),
          ),
        ),
      ),
    ],
  );

  blocTest<ContactInformationFormBloc, ContactInformationFormState>(
    'not allow save contact information is wrong',
    build: () => ContactInformationFormBloc(),
    seed: () => initialState,
    act: (bloc) => bloc..add(Saved()),
    expect: () => <ContactInformationFormState>[
      initialState.copyWith(
        showErrorMessages: true,
        saveFailureOrSuccessOption:
            some(left(const InvalidEmailFailure(failedValue: ''))),
      ),
    ],
  );
}
