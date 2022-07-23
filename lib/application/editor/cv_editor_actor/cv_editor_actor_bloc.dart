import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_actor/cv_templates.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'cv_editor_actor_event.dart';
part 'cv_editor_actor_state.dart';

@injectable
class CvEditorActorBloc extends Bloc<CvEditorActorEvent, CvEditorActorState> {
  CvEditorActorBloc() : super(CvEditorActorState.initial()) {
    on<CvEditorActorEvent>((event, emit) {
      if (event is TemplateChanged) {
        emit(state.copyWith(template: event.template));
      }
    });
  }
}
