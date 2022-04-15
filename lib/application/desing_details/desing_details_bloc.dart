import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'desing_details_event.dart';
part 'desing_details_state.dart';

class DesingDetailsBloc extends Bloc<DesingDetailsEvent, DesingDetailsState> {
  DesingDetailsBloc() : super(Loading()) {
    on<DesingDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
