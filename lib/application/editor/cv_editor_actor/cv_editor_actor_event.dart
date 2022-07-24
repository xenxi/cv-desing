part of 'cv_editor_actor_bloc.dart';

abstract class CvEditorActorEvent extends Equatable {
  const CvEditorActorEvent();

  @override
  List<Object> get props => [];
}

class TemplateChanged extends CvEditorActorEvent {
  const TemplateChanged(this.template);
  final CvTemplates template;

  @override
  List<Object> get props => [template];
}

class ResumeChanged extends CvEditorActorEvent {
  const ResumeChanged(this.resume);
  final Resume resume;

  @override
  List<Object> get props => [resume];
}
