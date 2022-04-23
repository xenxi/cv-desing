// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cv_editor_event.dart';
part 'cv_editor_state.dart';

class CveditorBloc extends Bloc<CveditorEvent, CveditorState> {
  CveditorBloc() : super(Empty()) {
    on<CveditorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
