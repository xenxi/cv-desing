import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/domain/auth/failures/auth_failures.dart';
import 'package:cv_desing_website_flutter/domain/auth/i_auth_facade.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/password.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;
  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      if (event is EmailChanged) {
        emit(state.copyWith(email: EmailAddress.create(event.email)));
      } else if (event is PasswordChanged) {
        emit(state.copyWith(password: Password.create(event.password)));
      } else if (event is SignInWithEmailAndPasswordPressed) {
        if (state.email.isValid() && state.password.isValid()) {
          emit(state.copyWith(showLoader: true));
          final failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
              email: state.email.getOrCrash(),
              password: state.password.getOrCrash());
          emit(state.copyWith(
              showErrorMessages: true,
              showLoader: false,
              failureOrSuccessOption: some(failureOrSuccess)));
        } else {
          emit(state.copyWith(
              showErrorMessages: true, failureOrSuccessOption: none()));
        }
      }
    });
  }
}
