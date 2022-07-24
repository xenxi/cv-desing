part of 'cv_editor_actor_bloc.dart';

abstract class CvEditorActorEvent extends Equatable {
  const CvEditorActorEvent();

  @override
  List<Object> get props => [];
}

class ResumeChanged extends CvEditorActorEvent {
  const ResumeChanged(this.resume);
  final Resume resume;

  @override
  List<Object> get props => [resume];
}
