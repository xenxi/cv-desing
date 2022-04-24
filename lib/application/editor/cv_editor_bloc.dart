// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'cv_editor_event.dart';
part 'cv_editor_state.dart';

@injectable
class CveditorBloc extends Bloc<CveditorEvent, CveditorState> {
  CveditorBloc() : super(CveditorState.initial()) {
    on<CveditorEvent>((event, emit) {
      if (event is SectionChanged) {
        emit(state.copyWith(section: event.section));
      }
    });
  }
}