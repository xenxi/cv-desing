import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/phone_number.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ContactInformation extends Equatable {
  factory ContactInformation.empty() => ContactInformation(
        emailAddress: EmailAddress.empty(),
        phoneNumber: PhoneNumber.empty(),
      );
  const ContactInformation(
      {required this.emailAddress, required this.phoneNumber});

  final EmailAddress emailAddress;
  final PhoneNumber phoneNumber;
  @override
  List<Object?> get props => [emailAddress, phoneNumber];

  ContactInformation copyWith({
    EmailAddress? emailAddress,
    PhoneNumber? phoneNumber,
  }) {
    return ContactInformation(
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Option<Failure> get failureOption => emailAddress.failureOrUnit
      .andThen(phoneNumber.failureOrUnit)
      .fold((l) => some(l), (_) => none());
}
