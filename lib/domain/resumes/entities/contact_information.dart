import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/social_media.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/phone_number.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ContactInformation extends Equatable {
  factory ContactInformation.empty() => ContactInformation(
        emailAddress: EmailAddress.empty(),
        phoneNumber: PhoneNumber.empty(),
        socialMedias: SocialMedias.empty(),
      );
  const ContactInformation({
    required this.emailAddress,
    required this.phoneNumber,
    required this.socialMedias,
  });

  final EmailAddress emailAddress;
  final PhoneNumber phoneNumber;
  final SocialMedias socialMedias;
  @override
  List<Object?> get props => [emailAddress, phoneNumber, socialMedias];

  ContactInformation copyWith({
    EmailAddress? emailAddress,
    PhoneNumber? phoneNumber,
    SocialMedias? socialMedias,
  }) {
    return ContactInformation(
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      socialMedias: socialMedias ?? this.socialMedias,
    );
  }

  Option<Failure> get failureOption => emailAddress.failureOrUnit
      .andThen(phoneNumber.failureOrUnit)
      .andThen(socialMedias.failureOrUnit)
      .fold((l) => some(l), (_) => none());
}
