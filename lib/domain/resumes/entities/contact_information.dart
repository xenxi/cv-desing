import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/phone_number.dart';
import 'package:equatable/equatable.dart';

class ContactInformation extends Equatable {
  const ContactInformation(this.emailAddress, this.phoneNumber);

  final EmailAddress emailAddress;
  final PhoneNumber phoneNumber;
  @override
  List<Object?> get props => [emailAddress, phoneNumber];
}
