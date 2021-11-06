import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc() : super(Empty()) {
    on<SignInFormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
