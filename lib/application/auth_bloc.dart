import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Initial()) {
    on<AuthEvent>((event, emit) {
      if (event is AuthCheckRequested) {
        emit(Authenticated());
      }
    });
  }
}
