import 'package:cv_desing_website_flutter/domain/auth/i_auth_facade.dart';
import 'package:cv_desing_website_flutter/domain/auth/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._authFacade,
  ) : super(Initial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckRequested) {
        final userOption = await _authFacade.getSignedInUser();
        final authState =
            userOption.fold(() => Unauthenticated(), (a) => Authenticated(a));
        emit(authState);
      } else if (event is SignOut) {
        await _authFacade.signOut();
        emit(Unauthenticated());
      }
    });
  }

  final IAuthFacade _authFacade;
}
