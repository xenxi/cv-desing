import 'package:cv_desing_website_flutter/domain/auth/failures/auth_failures.dart';
import 'package:cv_desing_website_flutter/domain/auth/i_auth_facade.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/password.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      if (event is EmailChanged) {
        emit(state.copyWith(email: EmailAddress(event.email)));
      } else if (event is PasswordChanged) {
        emit(state.copyWith(password: Password(event.password)));
      } else if (event is SignInWithEmailAndPasswordPressed) {
        if (state.email.isValid() && state.password.isValid()) {
          emit(state.copyWith(showLoader: true));
          final failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
            email: state.email,
            password: state.password,
          );
          emit(
            state.copyWith(
              showErrorMessages: true,
              showLoader: false,
              failureOrSuccessOption: some(failureOrSuccess),
            ),
          );
        } else {
          emit(
            state.copyWith(
              showErrorMessages: true,
              failureOrSuccessOption: none(),
            ),
          );
        }
      } else if (event is SignInWithGooglePressed) {
        emit(state.copyWith(showLoader: true));
        final failureOrSuccess = await _authFacade.signInWithGoogle();
        emit(
          state.copyWith(
            showErrorMessages: true,
            showLoader: false,
            failureOrSuccessOption: some(failureOrSuccess),
          ),
        );
      } else if (event is SignUpWithEmailAndPasswordPressed) {
        if (state.email.isValid() && state.password.isValid()) {
          emit(state.copyWith(showLoader: true));
          final failureOrSuccess = await _authFacade.signUpWithEmailAndPassword(
            email: state.email,
            password: state.password,
          );
          emit(
            state.copyWith(
              showErrorMessages: true,
              showLoader: false,
              failureOrSuccessOption: some(failureOrSuccess),
            ),
          );
        } else {
          emit(
            state.copyWith(
              showErrorMessages: true,
              failureOrSuccessOption: none(),
            ),
          );
        }
      }
    });
  }
  final IAuthFacade _authFacade;
}
