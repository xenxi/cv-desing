import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/domain/auth/failures/auth_failures.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/password.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc() : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) {
      if (event is EmailChanged) {
        emit(SignInFormState(
            email: EmailAddress.create(event.email),
            password: state.password,
            failureOrSuccessOption: none()));
      } else if (event is PasswordChanged) {
        emit(SignInFormState(
            email: state.email,
            password: Password.create(event.password),
            failureOrSuccessOption: none()));
      }
    });
  }
}
