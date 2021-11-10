import 'package:cv_desing_website_flutter/domain/auth/i_auth_facade.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._authFacade,
  ) : super(Initial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckRequested) {
        final userOption = await _authFacade.getSignedInUser();
        final authState =
            userOption.fold(() => Unauthenticated(), (a) => Authenticated());
        emit(authState);
      }
    });
  }

  final IAuthFacade _authFacade;
}
