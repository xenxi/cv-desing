// ignore: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/contact_information.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/phone_number.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/url.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'contact_information_form_event.dart';
part 'contact_information_form_state.dart';

class ContactInformationFormBloc
    extends Bloc<ContactInformationFormEvent, ContactInformationFormState> {
  ContactInformationFormBloc() : super(ContactInformationFormState.initial()) {
    on<ContactInformationFormEvent>((event, emit) {
      if (event is EmailChanged) {
        emit(
          state.copyWith(
            contactInformation: state.contactInformation.copyWith(
              emailAddress: EmailAddress(event.email),
            ),
          ),
        );
      } else if (event is PhoneNumberChanged) {
        emit(
          state.copyWith(
            contactInformation: state.contactInformation.copyWith(
              phoneNumber: PhoneNumber(event.phoneNumber),
            ),
          ),
        );
      } else if (event is Saved) {
        final Either<Failure, Unit> failureOrSuccess = state
            .contactInformation.failureOption
            .fold(() => right(unit), (a) => left(a));

        emit(
          state.copyWith(
            saveFailureOrSuccessOption: some(failureOrSuccess),
            showErrorMessages: true,
          ),
        );
      } else if (event is FacebookUrlChanged) {
        emit(
          state.copyWith(
            contactInformation: state.contactInformation.copyWith(
              socialMedias: state.contactInformation.socialMedias.copyWith(
                facebookOption: _urlOption(event.url),
              ),
            ),
          ),
        );
      } else if (event is LinkedinUrlChanged) {
        emit(
          state.copyWith(
            contactInformation: state.contactInformation.copyWith(
              socialMedias: state.contactInformation.socialMedias.copyWith(
                linkedinOption: _urlOption(event.url),
              ),
            ),
          ),
        );
      } else if (event is TwitterUrlChanged) {
        emit(
          state.copyWith(
            contactInformation: state.contactInformation.copyWith(
              socialMedias: state.contactInformation.socialMedias.copyWith(
                twitterOption: _urlOption(event.url),
              ),
            ),
          ),
        );
      } else if (event is GithubUrlChanged) {
        emit(
          state.copyWith(
            contactInformation: state.contactInformation.copyWith(
              socialMedias: state.contactInformation.socialMedias.copyWith(
                githubOption: _urlOption(event.url),
              ),
            ),
          ),
        );
      } else if (event is InstagramUrlChanged) {
        emit(
          state.copyWith(
            contactInformation: state.contactInformation.copyWith(
              socialMedias: state.contactInformation.socialMedias.copyWith(
                instagramOption: _urlOption(event.url),
              ),
            ),
          ),
        );
      } else if (event is YoutubeUrlChanged) {
        emit(
          state.copyWith(
            contactInformation: state.contactInformation.copyWith(
              socialMedias: state.contactInformation.socialMedias.copyWith(
                youtubeOption: _urlOption(event.url),
              ),
            ),
          ),
        );
      } else if (event is TwitchUrlChanged) {
        emit(
          state.copyWith(
            contactInformation: state.contactInformation.copyWith(
              socialMedias: state.contactInformation.socialMedias.copyWith(
                twitchOption: _urlOption(event.url),
              ),
            ),
          ),
        );
      } else if (event is PersonalUrlChanged) {
        emit(
          state.copyWith(
            contactInformation: state.contactInformation.copyWith(
              socialMedias: state.contactInformation.socialMedias.copyWith(
                personalOption: _urlOption(event.url),
              ),
            ),
          ),
        );
      }
    });
  }
}

Option<Url> _urlOption(String url) => url.isEmpty ? none() : some(Url(url));
