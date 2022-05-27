// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/contact_information.dart';
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
      }
    });
  }
}
