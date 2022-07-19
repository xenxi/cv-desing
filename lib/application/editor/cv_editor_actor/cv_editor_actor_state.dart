part of 'cv_editor_actor_bloc.dart';

class CvEditorActorState extends Equatable {
  factory CvEditorActorState.initial() =>
      const CvEditorActorState(template: CvTemplates.green);
  const CvEditorActorState({required this.template});
  final CvTemplates template;
  @override
  List<Object> get props => [template];
}
