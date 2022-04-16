// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'desings_event.dart';
part 'desings_state.dart';

class DesingsBloc extends Bloc<DesingsEvent, DesingsState> {
  DesingsBloc() : super(DesingsInitial()) {
    on<DesingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
